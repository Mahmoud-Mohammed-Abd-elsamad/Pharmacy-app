import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/user_info.dart';
import '../repositories/profiel_domain_repo.dart';

class ProfileUseCase {

  final ProfileDomainRepo profileDomainRepo;

  ProfileUseCase({required this.profileDomainRepo});

  Future<Either<FailureError, UserInfo>> getProfileData({required String id}) {
    return profileDomainRepo.getProfileData(id: id);
  }

}