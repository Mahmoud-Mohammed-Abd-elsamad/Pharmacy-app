import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/forget_password_model.dart';
import '../repositories/forget_password_doman_repo.dart';

class ForgetPasswordUseCase {

  ForgetPasswordUseCase({required this.forgetPasswordDomainRepo});

  ForgetPasswordDomainRepo forgetPasswordDomainRepo;

  Future<Either<FailureError, ForgetPasswordModel>> forgetPassword(String email)  {
    return forgetPasswordDomainRepo.forgetPassword(email);
  }
}