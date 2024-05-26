import 'package:dartz/dartz.dart';
import 'package:farmacy_app/core/error/failures.dart';
import 'package:farmacy_app/features/location_screen/data/data_sources/branches_data_source.dart';
import 'package:farmacy_app/features/location_screen/data/models/branch_model.dart';
import 'package:farmacy_app/features/location_screen/domain/repositories/branches_domain_repository.dart';

class BranchesDataRepo extends BranchesDomainRepo{
  BranchesDataRepo({required this.branchesDataSource});
 final  BranchesDataSource branchesDataSource ;
  @override
  Future<Either<FailureError, List<BranchModel>>> getBranchesByAddress(String stateName) {
    return branchesDataSource.getBranchesByAddress(stateName);
  }

}

