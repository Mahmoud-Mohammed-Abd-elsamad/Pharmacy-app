import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:farmacy_app/core/api/api_servicess.dart';
import 'package:farmacy_app/core/api/end_points.dart';
import 'package:farmacy_app/core/error/failures.dart';
import 'package:farmacy_app/core/utils/cach_helper.dart';
import 'package:farmacy_app/features/home/data/models/user_info.dart';

abstract class ProfileDataSource {
  Future<Either<FailureError, UserInfo>> getProfileData({required String id});
}

class RemoteProfileDataSource implements ProfileDataSource {
  @override
  Future<Either<FailureError, UserInfo>> getProfileData(
      {required String id}) async {
    var api = ApiServices();
    String id = CachHelper.getUserId()!;
    String token = CachHelper.getToken()!;
    try {
      var response = await api.getWithBody(
          url: EndPoints.baseUrl + EndPoints.profile,
          data: {"id": id},
          token: token);
      if (response.statusCode == 200) {
        log("get user info  Success >>>>>>>>>>>>>>> =  ${response.data}");
        return Right(UserInfo.fromJson(response.data));
      } else {
        return Left(FailureError(response.data.toString()));
      }
    } catch (e) {
      return Left(FailureError(e.toString()));
    }
  }
}
