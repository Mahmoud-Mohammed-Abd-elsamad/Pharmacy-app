
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:farmacy_app/features/forget_password_screen/data/models/reset_password_body.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/error/failures.dart';
import '../models/forget_password_model.dart';

abstract class ForgetPasswordDataSource {
  Future<Either<FailureError, ForgetPasswordModel>> forgetPassword(
      {required String email});

  Future<Either<FailureError, ForgetPasswordModel>> resetPassword(
      {required ResetPasswordBody resetPasswordBody});
}

class RemoteForgetPasswordDataSource extends ForgetPasswordDataSource {
  @override
  Future<Either<FailureError, ForgetPasswordModel>> forgetPassword(
      {required String email}) async {
  try{
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
      ForgetPasswordModel forgetPasswordModel =
      ForgetPasswordModel.fromJson(response.data);
      return Right(forgetPasswordModel);
    } else {
      return Left(FailureError(response.statusCode.toString()));
    }
  }catch(e){
    return Left(FailureError(e.toString()));

  }
  }

  @override
  Future<Either<FailureError, ForgetPasswordModel>> resetPassword(
      {required ResetPasswordBody resetPasswordBody}) async {
   try{
     final dio = Dio();
     final response = await dio.post(
       EndPoints.baseUrl + EndPoints.resetPassword,
       data: {
         "email": resetPasswordBody.email,
         "Otp": resetPasswordBody.otp,
         "NewPassword": resetPasswordBody.newPassword
       },
     );
     print("data ${response.statusCode.toString()}>>resetPassword>>${response.data}");
     if (response.statusCode == 200) {
       print("data ${response.statusCode.toString()}>resetPassword>>>${response.data}");
       ForgetPasswordModel forgetPasswordModel =
       ForgetPasswordModel.fromJson(response.data);
       return Right(forgetPasswordModel);
     } else {
       return Left(FailureError(response.statusCode.toString()));
     }
   }catch(e){
     return Left(FailureError(e.toString()));

   }
  }
}

class LocalForgetPasswordDataSource extends ForgetPasswordDataSource {
  @override
  Future<Either<FailureError, ForgetPasswordModel>> forgetPassword(
      {required String email}) {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<FailureError, ForgetPasswordModel>> resetPassword(
      {required ResetPasswordBody resetPasswordBody}) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }
}
