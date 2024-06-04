import 'dart:convert';
import 'dart:developer';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
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

  Future<Either<FailureError, Map<String, dynamic>>>
  deleteMedicineInSpecificCategory({required String medicineId});
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

        List itemList = response.data;
        log("created itemList  =  ${itemList.length}  items");
        return Right(itemList
            .map((e) => SelectedCategoryItemModel.fromJson(e))
            .toList());
      } else {
        return Left(FailureError(response.data.toString()));
      }
    } catch (e) {
      return Left(FailureError(e.toString()));
    }
  }

  @override
  Future<Either<FailureError, Map<String, dynamic>>>
  createMedicineInSpecificCategory({required MedicineBody medicineBody}) async {
    try {
      ApiServices apiServices = ApiServices();

      FormData formData = FormData.fromMap({
        "name": medicineBody.name,
        "description": medicineBody.description,
        "price": medicineBody.price,
        "medicineQuantity": medicineBody.medicineQuantity,
        "categoryId": medicineBody.categoryId,
        "Photo": await MultipartFile.fromFile(medicineBody.photo!.path,
            filename: 'image.jpg')
      });

      final Dio _dio = Dio();

      var result = await _dio.post(EndPoints.baseUrl + EndPoints.createMedicine,
          data: formData,
          options: Options(
            contentType: "multipart/form-dat",
          ));
      if (result.statusCode == 200 || result.statusCode == 201) {
        return Right(result.data);
      } else {
        return Left(FailureError(result.data.toString()));
      }
    } catch (e) {

      return Left(FailureError(e.toString()));
    }
  }

  @override
  Future<Either<FailureError,
      Map<String, dynamic>>> deleteMedicineInSpecificCategory(
      {required String medicineId}) async {
    ApiServices apiServices = ApiServices();

    try {

      var response = await apiServices.delete(
        url: EndPoints.baseUrl + EndPoints.deleteMedicine + medicineId,
      );

      if (response.statusCode == 200) {;

        return Right(response.data);
      } else {

        return Left(FailureError(response.statusCode.toString()));
      }
    } catch (e) {

      return Left(FailureError(e.toString()));
    }
  }

  @override
  Future<Either<FailureError,
      Map<String, dynamic>>> updateMedicineInSpecificCategory(
      {required MedicineBody medicineBody}) async {


    try {
      ApiServices apiServices = ApiServices();

      FormData formData = FormData.fromMap({
        'id': medicineBody.id,
        'name': medicineBody.name,
        'description': medicineBody.description?? " no description",
        'price': medicineBody.price,
        'medicineQuantity': medicineBody.medicineQuantity,
        'categoryId': medicineBody.categoryId,
        'Photo':medicineBody.photo == null ? null : await MultipartFile.fromFile(
            medicineBody.photo!.path, filename: 'image.jpg'),
      });
      // Perform PUT request
      Response response = await apiServices.put(
       url: EndPoints.baseUrl + EndPoints.updateMedicine,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
            'Accept': '*/*',
            'Accept-Encoding': 'gzip, deflate, br',
            'Connection': 'keep-alive',
            'User-Agent': 'PostmanRuntime/7.39.0',
          },
        ),
      );

      // Handle response
      if (response.statusCode == 200) {
        print("Update successful: ${response.data}");
        return Right(response.data);
      } else {
        print("Update failed: ${response.statusCode}");
        return Left(FailureError(response.statusCode.toString()));
      }
    } catch (e) {
      print("Error occurred: cache error $e");
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

  @override

  Future<Either<FailureError, Map<String, dynamic>>> deleteMedicineInSpecificCategory({required String medicineId}) {
    // TODO: implement deleteMedicineInSpecificCategory
    throw UnimplementedError();
  }
}
