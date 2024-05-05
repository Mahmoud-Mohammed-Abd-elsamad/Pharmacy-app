import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:farmacy_app/features/login_screen/data/models/login_body.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/error/failures.dart';
import '../models/login_model.dart';

abstract class LoginUserDataSource {
  Future<Either<FailureError, LoginModel>> loginUser(LoginBody loginBody);
}

class RemoteLoginUserDataSource extends LoginUserDataSource {
  @override
  Future<Either<FailureError, LoginModel>> loginUser(LoginBody loginBody) async {
    final dio = Dio();
    final response = await dio.post(
      EndPoints.baseUrl + EndPoints.login,
      data: {
        "email": loginBody.email,
        "password": loginBody.password
      },
    );
    if (response.statusCode == 200) {

      LoginModel loginModel = LoginModel.fromJson(response.data);
      log(loginModel.toString());

      return Right(loginModel);
    } else {
      return Left(FailureError(response.statusCode.toString()));
    }
  }
}
class LocalLoginUserDataSource extends LoginUserDataSource {
  @override
  Future<Either<FailureError, LoginModel>> loginUser(LoginBody loginBody) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }
}