import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/forget_password_model.dart';
import '../../data/models/reset_password_body.dart';

abstract class ForgetPasswordDomainRepo {
  Future<Either<FailureError, ForgetPasswordModel>> forgetPassword(String email);
  Future<Either<FailureError, ForgetPasswordModel>> resetPassword(ResetPasswordBody resetPasswordBody);
}