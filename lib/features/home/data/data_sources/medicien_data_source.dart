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
  createMedicineInSpecificCategory({required MedicineBody medicineBody}) async {
    log("createMedicineInSpecificCategory called");
    try {
      ApiServices apiServices = ApiServices();
      log("createMedicine called  ${medicineBody.name} name >>>>>>>>>>>>>>>");
      log("createMedicine called  ${medicineBody.photo} price>>>>>>>>>>>>>>>>>>.");

      FormData formData = FormData.fromMap({
        "name": medicineBody.name,
        "description": medicineBody.description,
        "price": medicineBody.price,
        "medicineQuantity": medicineBody.medicineQuantity,
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
        log( "${medicineBody.price}>>>>>>${medicineBody.medicineQuantity}#######################################################################################################");

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
  // Future<Either<FailureError, Map<String, dynamic>>>
  // updateMedicineInSpecificCategory({required MedicineBody medicineBody}) async {
  //   try {
  //     log("updateMedicineInSpecificCategory called  data Source");
  //     log("updateMedicineInSpecificCategory id  ${medicineBody.id}");
  //
  //     ApiServices apiServices = ApiServices();
  //
  //     FormData formData = FormData.fromMap({
  //       "id": medicineBody.id,
  //      "name": medicineBody.name,
  //      "description": medicineBody.description,
  //      "price": medicineBody.price,
  //      "medicineQuantity": medicineBody.price,
  //       "categoryId": medicineBody.categoryId,
  //       // "Photo": await MultipartFile.fromFile(medicineBody.photo!.path,
  //       //     filename: 'image.jpg')
  //     });
  //     log("updateMedicineInSpecificCategory called  data Source ${medicineBody.toJson()}");
  //
  //     final Dio _dio = Dio();
  //
  //     //
  //     // var stream = await medicineBody.photo?.openRead();
  //     //
  //     // // Get the file length
  //     // int length =  await medicineBody.photo!.length();
  //     //
  //     // // Create a MultipartFile
  //     // var multipartFile = MultipartFile(
  //     //     stream as Stream<List<int>>,
  //     //     length,
  //     //     filename:  medicineBody.photo?.path.split('/').last,
  //     //     contentType: MediaType('image', 'jpeg')Z,);
  //
  //         var result = await _dio.put(EndPoints.baseUrl + EndPoints.updateCartItem,
  //        // data: formData,
  //
  //         data: jsonEncode(medicineBody.toJson()),
  //         options: Options(headers: {
  //
  //           'Content-Type': 'application/json',
  //           "Content-Length": "multipart/form-data; boundary=<calculated when request is sent>",
  //           "Host":"<calculated when request is sent>",
  //           "User-Agent":"PostmanRuntime/7.39.0",
  //           "Accept":"*/*",
  //           "Accept-Encoding":"gzip, deflate, br",
  //           "Connection":"keep-alive"
  //         }
  //         ));
  //     log("updateMedicineInSpecificCategory medcineId : ${medicineBody.id}");
  //     log("updateMedicineInSpecificCategory statusCode  ${result.statusCode}");
  //
  //     if (result.statusCode == 200 || result.statusCode == 201) {
  //       return Right(result.data);
  //     } else {
  //       log("updateMedicineInSpecificCategory statusCode Error  ${result.statusCode}");
  //
  //       return Left(FailureError(result.data.toString()));
  //     }
  //   } catch (e) {
  //     log("updateMedicineInSpecificCategory catch error  ${e.toString()}");
  //
  //     return Left(FailureError(e.toString()));
  //   }
  // }


  @override
  Future<Either<FailureError,
      Map<String, dynamic>>> deleteMedicineInSpecificCategory(
      {required String medicineId}) async {
    ApiServices apiServices = ApiServices();

    try {
      log("deleteMedicineInSpecificCategory Data Source");

      var response = await apiServices.delete(
        url: EndPoints.baseUrl + EndPoints.deleteMedicine + medicineId,
      );
      log("deleteMedicineInSpecificCategory ${response.statusCode}");

      if (response.statusCode == 200) {
        log("deleteMedicineInSpecificCategory  success ${response.statusCode}");
        log("deleteMedicineInSpecificCategory  success ${response.data}");

        return Right(response.data);
      } else {
        log("deleteMedicineInSpecificCategory  failed ${response.statusCode}");

        return Left(FailureError(response.statusCode.toString()));
      }
    } catch (e) {
      log("deleteMedicineInSpecificCategory  failed catch${e.toString()} ");

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
