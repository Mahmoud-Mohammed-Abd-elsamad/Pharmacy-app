import 'package:dartz/dartz.dart';
import 'package:farmacy_app/core/error/failures.dart';
import 'package:farmacy_app/features/home/data/data_sources/categories_data_source.dart';
import 'package:farmacy_app/features/home/data/models/category_model.dart';
import 'package:farmacy_app/features/home/domain/repositories/catetgories_domain_repo.dart';

class CategoriesDataRepo extends CategoriesDomainRepo{
  CategoriesDataRepo(this.categoriesDataSource);

  final CategoriesDataSource categoriesDataSource;

  @override
  Future<Either<FailureError, List<CategoryModel>>> getCategories() {
    return categoriesDataSource.getAllCategories();
  }

}