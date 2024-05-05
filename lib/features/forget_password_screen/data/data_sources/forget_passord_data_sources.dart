import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../models/forget_password_model.dart';

abstract class ForgetPasswordDataSource {
  Future<Either<FailureError, ForgetPasswordModel>> forgetPassword({required String email});
}

class RemoteForgetPasswordDataSource extends ForgetPasswordDataSource {
  @override
  Future<Either<FailureError, ForgetPasswordModel>>  forgetPassword({required String email}) async {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }
}

class LocalForgetPasswordDataSource extends ForgetPasswordDataSource {
  @override
  Future<Either<FailureError, ForgetPasswordModel>> forgetPassword({required String email}) {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }
}