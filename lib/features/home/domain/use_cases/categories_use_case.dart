import 'package:dartz/dartz.dart';
import 'package:farmacy_app/core/error/failures.dart';
import 'package:farmacy_app/features/home/data/models/category_model.dart';
import 'package:farmacy_app/features/home/domain/repositories/catetgories_domain_repo.dart';

class CategoriesUseCase{
  CategoriesUseCase({required this.categoriesDomainRepo});
 final CategoriesDomainRepo categoriesDomainRepo;

  Future<Either<FailureError, List<CategoryModel>>>getCategories(){

   return categoriesDomainRepo.getCategories();
 }

}