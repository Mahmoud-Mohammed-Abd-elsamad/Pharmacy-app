import 'package:dartz/dartz.dart';
import 'package:farmacy_app/features/RegisterScreen/data/repositories/register_data_repo.dart';
import 'package:farmacy_app/features/RegisterScreen/domain/repositories/domain_repo.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/register_body.dart';
import '../../data/models/register_mode.dart';

class RegisterUserUseCase {
  RegisterUserUseCase({required this.registerDomainRepo});

  RegisterDomainRepo registerDomainRepo;

  Future<Either<FailureError, RegisterModel>> call(RegisterBody registerBody) {

     return registerDomainRepo.registerUser(registerBody);

  }
}