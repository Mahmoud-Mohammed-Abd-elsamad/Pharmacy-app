import 'package:dartz/dartz.dart';

import 'package:farmacy_app/core/error/failures.dart';

import 'package:farmacy_app/features/home/data/models/user_info.dart';

import '../../domain/repositories/profiel_domain_repo.dart';
import '../data_sources/profile_data_source.dart';

class ProfileDataRepo extends ProfileDomainRepo{
  ProfileDataRepo({required this.profiledDataSource});
  final ProfileDataSource profiledDataSource;
  @override
  Future<Either<FailureError, UserInfo>> getProfileData({required String id}) {
  return profiledDataSource.getProfileData(id: id);
  }
}