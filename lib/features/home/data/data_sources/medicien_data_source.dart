import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:farmacy_app/core/api/api_servicess.dart';
import 'package:farmacy_app/core/api/end_points.dart';
import 'package:farmacy_app/features/home/data/models/item_model.dart';

import '../../../../core/error/failures.dart';

abstract class MedicineDataSource {
  Future<Either<FailureError, List<SelectedCategoryItemModel>>>
      getMedicinesByCategoryId({required String id});
}

class RemoteMedicineDataSource implements MedicineDataSource {
  @override
  Future<Either<FailureError, List<SelectedCategoryItemModel>>>
      getMedicinesByCategoryId({required String id}) async {
    ApiServices apiServices = ApiServices();

    try {
      var response = await apiServices.get(
          url: EndPoints.baseUrl + EndPoints.getMedicinesByCategoryId + id);
      if (response.statusCode == 200) {
        log("getMedicinesByCategoryId ${response.statusCode}");
        log("getMedicinesByCategoryId ${response.data}");
        log("getMedicinesByCategoryId55>> ${response.data.length}");
        // List<SelectedCategoryItemModel> itemList =  response.data.map((e) =>
        // SelectedCategoryItemModel.fromJson(e)).toList();
        List itemList = response.data;
        log("created itemList  =  ${itemList.length}  items");
        return Right(itemList.map((e) => SelectedCategoryItemModel()).toList());
      } else {
        log("getMedicinesByCategoryId error1 ${response.statusCode}");
        return Left(FailureError(response.data.toString()));
      }
    } catch (e) {
      log("getMedicinesByCategoryId error ${e.toString()}");
      return Left(FailureError(e.toString()));
    }
  }
}

class LocalMedicineDataSource implements MedicineDataSource {
  @override
  Future<Either<FailureError, List<SelectedCategoryItemModel>>>
      getMedicinesByCategoryId({required String id}) {
    // TODO: implement getMedicinesByCategoryId
    throw UnimplementedError();
  }
}
