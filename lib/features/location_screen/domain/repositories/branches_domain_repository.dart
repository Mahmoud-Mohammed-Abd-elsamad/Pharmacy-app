import 'package:dartz/dartz.dart';
import 'package:farmacy_app/features/location_screen/data/models/branch_model.dart';

import '../../../../core/error/failures.dart';

abstract class BranchesDomainRepo {
  Future<Either<FailureError, List<BranchModel>>> getBranchesByAddress(String stateName) ;

}