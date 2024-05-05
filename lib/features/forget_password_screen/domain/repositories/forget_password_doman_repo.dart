import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/forget_password_model.dart';

abstract class ForgetPasswordDomainRepo {
  Future<Either<FailureError, ForgetPasswordModel>> forgetPassword();
}