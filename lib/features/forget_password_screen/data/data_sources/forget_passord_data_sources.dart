import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/error/failures.dart';
import '../models/forget_password_model.dart';

abstract class ForgetPasswordDataSource {
  Future<Either<FailureError, ForgetPasswordModel>> forgetPassword({required String email});
}

class RemoteForgetPasswordDataSource extends ForgetPasswordDataSource {
  @override
  Future<Either<FailureError, ForgetPasswordModel>>  forgetPassword({required String email}) async {

    final dio = Dio();
    final response = await dio.post(
      EndPoints.baseUrl + EndPoints.forgetPassword,
      data: {
        "email": email,
      },
    );
    print("data ${response.statusCode.toString()}>>>>${response.data}");
    if (response.statusCode == 200) {
      print("data ${response.statusCode.toString()}>>>>${response.data}");
      ForgetPasswordModel forgetPasswordModel = ForgetPasswordModel.fromJson(response.data);
      return Right(forgetPasswordModel);
    } else {
      return Left(FailureError(response.statusCode.toString()));
    }

  }
}

class LocalForgetPasswordDataSource extends ForgetPasswordDataSource {
  @override
  Future<Either<FailureError, ForgetPasswordModel>> forgetPassword({required String email}) {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }
}