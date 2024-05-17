import 'package:dartz/dartz.dart';
import 'package:farmacy_app/core/error/failures.dart';

import '../../data/models/category_model.dart';

abstract class CategoriesDomainRepo{

  Future<Either<FailureError, List<CategoryModel>>> getCategories();

}