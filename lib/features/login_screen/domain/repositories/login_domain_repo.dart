import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/login_body.dart';
import '../../data/models/login_model.dart';

abstract class LoginDomainRepo {
  Future<Either<FailureError, LoginModel>> loginUser(LoginBody loginBody);
}