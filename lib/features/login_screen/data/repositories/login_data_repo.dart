import 'package:dartz/dartz.dart';

import 'package:farmacy_app/core/error/failures.dart';
import 'package:farmacy_app/features/login_screen/data/data_sources/login_user_data_source.dart';

import 'package:farmacy_app/features/login_screen/data/models/login_body.dart';

import 'package:farmacy_app/features/login_screen/data/models/login_model.dart';

import '../../domain/repositories/login_domain_repo.dart';

class LoginDataRepo extends LoginDomainRepo {

  LoginUserDataSource loginUserDataSource;

  LoginDataRepo({required this.loginUserDataSource});

  @override
  Future<Either<FailureError, LoginModel>> loginUser(LoginBody loginBody) {
   return loginUserDataSource.loginUser(loginBody);
  }


}