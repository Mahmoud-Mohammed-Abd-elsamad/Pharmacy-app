import 'package:dartz/dartz.dart';
import 'package:farmacy_app/features/forget_password_screen/data/models/reset_password_body.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/forget_password_model.dart';
import '../repositories/forget_password_doman_repo.dart';

class ResetPasswordUseCase {

  ResetPasswordUseCase({required this.forgetPasswordDomainRepo});

  ForgetPasswordDomainRepo forgetPasswordDomainRepo;

  Future<Either<FailureError, ForgetPasswordModel>> resetPassword(ResetPasswordBody resetPasswordBody)  {
    return forgetPasswordDomainRepo.resetPassword(resetPasswordBody);
  }
}