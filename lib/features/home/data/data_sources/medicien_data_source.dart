import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:farmacy_app/core/api/api_servicess.dart';
import 'package:farmacy_app/core/api/end_points.dart';
import 'package:farmacy_app/features/home/data/models/item_model.dart';
import 'package:farmacy_app/features/home/data/models/medicineModel.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/assets.dart';
import '../models/medicine_body.dart';

abstract class MedicineDataSource {
  Future<Either<FailureError, List<SelectedCategoryItemModel>>>
      getMedicinesByCategoryId({required String id});

  Future<Either<FailureError, Map<String, dynamic>>>
      createMedicineInSpecificCategory({required MedicineBody medicineBody});

  Future<Either<FailureError, Map<String, dynamic>>>
  updateMedicineInSpecificCategory({required MedicineBody medicineBody});
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
        return Right(itemList
            .map((e) => SelectedCategoryItemModel.fromJson(e))
            .toList());
      } else {
        log("getMedicinesByCategoryId error1 ${response.statusCode}");
        return Left(FailureError(response.data.toString()));
      }
    } catch (e) {
      log("getMedicinesByCategoryId error ${e.toString()}");
      return Left(FailureError(e.toString()));
    }
  }

  @override
  Future<Either<FailureError, Map<String, dynamic>>>
      createMedicineInSpecificCategory(
          {required MedicineBody medicineBody}) async {
    log("createMedicineInSpecificCategory called");
    try {
      ApiServices apiServices = ApiServices();

      FormData formData = FormData.fromMap({
        "name": medicineBody.name,
        "description": medicineBody.description,
        "price": medicineBody.price,
        "medicineQuantity": medicineBody.price,
        "categoryId": medicineBody.categoryId,
        "Photo": await MultipartFile.fromFile(medicineBody.photo!.path,
            filename: 'image.jpg')
      });
      log("createMedicine called  ${medicineBody.toJson()}");

      final Dio _dio = Dio();

      var result = await _dio.post(EndPoints.baseUrl + EndPoints.createMedicine,
          data: formData,
          options: Options(
            contentType: "multipart/form-dat",
          ));
      log("createMedicine medcineNmae  ${medicineBody.name}");
      log("createMedicine statusCode  ${result.statusCode}");

      if (result.statusCode == 200 || result.statusCode == 201) {
        return Right(result.data);
      } else {
        log("createMedicine statusCode Error  ${result.statusCode}");

        return Left(FailureError(result.data.toString()));
      }
    } catch (e) {
      log("createMedicine already catch error  ${e.toString()}");

      return Left(FailureError(e.toString()));
    }
  }

  @override
  Future<Either<FailureError, Map<String, dynamic>>>
  updateMedicineInSpecificCategory({required MedicineBody medicineBody}) async {
    try {
      log("updateMedicineInSpecificCategory called  data Source");
      log("updateMedicineInSpecificCategory id  ${medicineBody.id}");

      ApiServices apiServices = ApiServices();

      FormData formData = FormData.fromMap({
        "id": "39",
       // "name": medicineBody.name,
      //  "description": medicineBody.description,
     //   "price": medicineBody.price,
     //   "medicineQuantity": medicineBody.price,
        "categoryId": "26",
      });
      log("updateMedicineInSpecificCategory called  data Source ${medicineBody.toJson()}");

      final Dio _dio = Dio();

      var result = await _dio.put(EndPoints.baseUrl + EndPoints.updateCartItem,
          data: formData,
          options: Options(
            contentType: Headers.multipartFormDataContentType,
          ));
      log("updateMedicineInSpecificCategory medcineId : ${medicineBody.id}");
      log("updateMedicineInSpecificCategory statusCode  ${result.statusCode}");

      if (result.statusCode == 200 || result.statusCode == 201) {
        return Right(result.data);
      } else {
        log("updateMedicineInSpecificCategory statusCode Error  ${result.statusCode}");

        return Left(FailureError(result.data.toString()));
      }
    } catch (e) {
      log("updateMedicineInSpecificCategory catch error  ${e.toString()}");

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

  @override
  Future<Either<FailureError, Map<String, String>>>
      createMedicineInSpecificCategory({required MedicineBody medicineBody}) {
    // TODO: implement createMedicineInSpecificCategory
    throw UnimplementedError();
  }

  @override
  Future<Either<FailureError, Map<String, dynamic>>> updateMedicineInSpecificCategory({required MedicineBody medicineBody}) {
    // TODO: implement updateMedicineInSpecificCategory
    throw UnimplementedError();
  }
}
