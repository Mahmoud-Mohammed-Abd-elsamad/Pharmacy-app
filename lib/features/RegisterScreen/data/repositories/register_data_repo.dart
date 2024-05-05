import 'package:dartz/dartz.dart';
import 'package:farmacy_app/core/error/failures.dart';
import 'package:farmacy_app/features/RegisterScreen/data/data_sources/register_data_source.dart';
import 'package:farmacy_app/features/RegisterScreen/data/models/register_body.dart';
import 'package:farmacy_app/features/RegisterScreen/data/models/register_mode.dart';
import 'package:farmacy_app/features/RegisterScreen/domain/repositories/domain_repo.dart';

class RegisterDataRepo extends RegisterDomainRepo {
  RegisterDataRepo({ required this.registerDataSource});

  RegisterDataSource registerDataSource;

  @override
  Future<Either<FailureError, RegisterModel>> registerUser(RegisterBody registerBody) {
    return registerDataSource.registerUser(registerBody);
  }
}