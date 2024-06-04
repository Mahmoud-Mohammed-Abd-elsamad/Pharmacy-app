import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:farmacy_app/core/api/end_points.dart';
import 'package:farmacy_app/core/error/failures.dart';
import 'package:farmacy_app/features/home/data/models/category_model.dart';

import '../../../../core/api/api_servicess.dart';

abstract class CategoriesDataSource {
  Future<Either<FailureError, List<CategoryModel>>> getAllCategories();
}

class RemoteCategoriesDataSource extends CategoriesDataSource {
  @override
  Future<Either<FailureError, List<CategoryModel>>> getAllCategories() async {
    ApiServices apiServices = ApiServices();
    try {
      var response = await apiServices.get(
          url: EndPoints.baseUrl + EndPoints.getAllCategories);
      log("message ${response.statusCode}");
      if (response.statusCode == 200) {
        List list = response.data;
        return Right(list.map((e) => CategoryModel.fromJson(e)).toList());
      } else {
        log("getAllCategories ${response.data.length + "  " + response.statusCode.toString()}");
        return left(FailureError("Error ${response.statusCode}"));
      }
    } catch (e) {
      return left(FailureError(e.toString()));
    }
  }
}

class LocalCategoriesDataSource extends CategoriesDataSource {
  @override
  Future<Either<FailureError, List<CategoryModel>>> getAllCategories() {
    // TODO: implement getAllCategories
    throw UnimplementedError();
  }
}
