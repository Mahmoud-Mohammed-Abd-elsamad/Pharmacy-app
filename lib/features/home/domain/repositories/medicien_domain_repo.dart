import 'package:dartz/dartz.dart';
import 'package:farmacy_app/core/error/failures.dart';

import '../../data/models/category_model.dart';
import '../../data/models/item_model.dart';

abstract class MedicineDomainRepo{

  Future<Either<FailureError, List<SelectedCategoryItemModel>>> getMedicinesByCategoryId(String id) ;

}