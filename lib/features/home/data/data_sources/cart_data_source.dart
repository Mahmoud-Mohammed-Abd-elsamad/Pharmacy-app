import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:farmacy_app/core/api/api_servicess.dart';
import 'package:farmacy_app/core/api/end_points.dart';
import 'package:farmacy_app/features/home/data/models/add_item_to_cart_body.dart';

import '../../../../core/error/failures.dart';
import '../models/add_item_to_cart_model.dart';
import '../models/get_all_cart_items_model.dart';
import '../models/update_cart_item_model.dart';

abstract class CartDataSource {
  Future<Either<FailureError, AddItemToCartModel>> addItemToCart(
      AddItemToCartBody addItemToCartBody);

  Future<Either<FailureError, List<MedicineCartModel>>> getAllCartItemsByUseID(
      String userID);

  Future<Either<FailureError, UpdateCartItemModel>> updateCartItem(
      UpdateCartItemModel updateCartItemModel);

  Future<Either<FailureError, void>> deleteCartItem(String cartId);
}

class RemoteCartDataSource extends CartDataSource {
  @override
  Future<Either<FailureError, AddItemToCartModel>> addItemToCart(
      AddItemToCartBody addItemToCartBody) async {
    ApiServices apiServices = ApiServices();

    try {
      log("addItemToCart Data Source");

      var response = await apiServices.post(
          url: EndPoints.baseUrl + EndPoints.addItemToCart,
          data: addItemToCartBody.toJson(),
          token: "");
      log("addItemToCart ${response.statusCode}");

      if (response.statusCode == 200) {
        AddItemToCartModel addItemToCartModel =
            AddItemToCartModel.fromJson(response.data);
        log("addItemToCart  success ${response.statusCode}");

        return Right(addItemToCartModel);
      } else {
        log("addItemToCart  failed ${response.statusCode}");

        return Left(FailureError(response.statusCode.toString()));
      }
    } catch (e) {
      log("addItemToCart  failed catch${e.toString()} ");

      return Left(FailureError(e.toString()));
    }
  }

  @override
  Future<Either<FailureError, List<MedicineCartModel>>> getAllCartItemsByUseID(
      String userID) async {
    ApiServices apiServices = ApiServices();

    try {
      log("getAllCartItemsByUseID Data Source");

      var response = await apiServices.get(
        url: EndPoints.baseUrl + EndPoints.getAllCartItems + userID,
      );
      log("getAllCartItemsByUseID ${response.statusCode}");

      if (response.statusCode == 200) {
        log("getAllCartItemsByUseID  success ${response.statusCode}");
        List items = response.data;
        log("getAllCartItemsByUseID  success ${items.length}");
        log("getAllCartItemsByUseID  success ${response.statusCode}");

        return Right(items.map((e) => MedicineCartModel.fromJson(e)).toList());
      } else {
        log("getAllCartItemsByUseID  failed ${response.statusCode}");

        return Left(FailureError(response.statusCode.toString()));
      }
    } catch (e) {
      log("getAllCartItemsByUseID  failed catch${e.toString()} ");

      return Left(FailureError(e.toString()));
    }
  }

  @override
  Future<Either<FailureError, UpdateCartItemModel>> updateCartItem(
      UpdateCartItemModel updateCartItemModel) async {
    ApiServices apiServices = ApiServices();

    try {
      log("updateCartItem Data Source");

      var response = await apiServices.put(
        url: EndPoints.baseUrl + EndPoints.updateCartItem,
        data: updateCartItemModel.toJson(),
      );
      log("updateCartItem ${response.statusCode}");

      if (response.statusCode == 200) {
        UpdateCartItemModel updateCartItemModelResponse =
            UpdateCartItemModel.fromJson(response.data);
        log("updateCartItem  success ${response.statusCode}");

        return Right(updateCartItemModelResponse);
      } else {
        log("updateCartItem  failed ${response.statusCode}");

        return Left(FailureError(response.statusCode.toString()));
      }
    } catch (e) {
      log("updateCartItem  failed catch${e.toString()} ");

      return Left(FailureError(e.toString()));
    }
  }

  @override
  Future<Either<FailureError, void>> deleteCartItem(String cartId) async {
    ApiServices apiServices = ApiServices();

    try {
      log("deleteCartItem Data Source");

      var response = await apiServices.delete(
        url: EndPoints.baseUrl + EndPoints.deleteCartItem  + cartId,
      );
      log("deleteCartItem ${response.statusCode}");

      if (response.statusCode == 200) {
        log("deleteCartItem  success ${response.statusCode}");
        log("deleteCartItem  success ${response.data}");

        return Right(response.data);
      } else {
        log("deleteCartItem  failed ${response.statusCode}");

        return Left(FailureError(response.statusCode.toString()));
      }
    } catch (e) {
      log("deleteCartItem  failed catch${e.toString()} ");

      return Left(FailureError(e.toString()));
    }
  }
}
