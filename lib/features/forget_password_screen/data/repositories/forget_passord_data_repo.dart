import 'package:dartz/dartz.dart';
import 'package:farmacy_app/core/error/failures.dart';
import 'package:farmacy_app/features/forget_password_screen/data/data_sources/forget_passord_data_sources.dart';
import 'package:farmacy_app/features/forget_password_screen/data/models/forget_password_model.dart';
import 'package:farmacy_app/features/forget_password_screen/domain/repositories/forget_password_doman_repo.dart';

class ForgetPasswordDataRepo extends ForgetPasswordDomainRepo {
  ForgetPasswordDataSource forgetPasswordDataSource;

  ForgetPasswordDataRepo({required this.forgetPasswordDataSource});

  @override
  Future<Either<FailureError, ForgetPasswordModel>> forgetPassword(String email) {
   return forgetPasswordDataSource.forgetPassword(email: email);
  }
}
