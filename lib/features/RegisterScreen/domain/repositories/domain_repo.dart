import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/register_body.dart';
import '../../data/models/register_mode.dart';

abstract class RegisterDomainRepo {

  Future<Either<FailureError,RegisterModel>> registerUser(RegisterBody registerBody);
}