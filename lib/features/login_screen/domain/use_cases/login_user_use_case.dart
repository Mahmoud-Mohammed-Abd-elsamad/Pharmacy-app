import 'package:dartz/dartz.dart';
import 'package:farmacy_app/features/login_screen/domain/repositories/login_domain_repo.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/login_body.dart';
import '../../data/models/login_model.dart';

class LoginUserUseCase {
  LoginUserUseCase({required this.loginDomainRepo});

  LoginDomainRepo loginDomainRepo;

  Future<Either<FailureError, LoginModel>> call(LoginBody loginBody) {
    return loginDomainRepo.loginUser(loginBody);
  }
}