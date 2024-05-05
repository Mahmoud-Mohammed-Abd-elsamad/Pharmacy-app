import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../models/login_model.dart';

abstract class LoginUserDataSource {
  Future<Either<FailureError, LoginModel>> loginUser(String email, String password);
}