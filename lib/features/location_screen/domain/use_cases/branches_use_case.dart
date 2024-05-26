import 'package:dartz/dartz.dart';
import 'package:farmacy_app/features/location_screen/domain/repositories/branches_domain_repository.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/branch_model.dart';

class BranchesUseCase{
  BranchesUseCase({ required this.branchesDomainRepository});
  final BranchesDomainRepo branchesDomainRepository;

  Future<Either<FailureError, List<BranchModel>>> getBranchesByAddress(String stateName) {

    return branchesDomainRepository.getBranchesByAddress(stateName);
  }


}