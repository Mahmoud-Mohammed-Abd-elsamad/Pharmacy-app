import 'dart:developer';

import 'package:farmacy_app/features/home/data/data_sources/cart_data_source.dart';
import 'package:farmacy_app/features/home/data/data_sources/cart_data_source.dart';
import 'package:farmacy_app/features/home/data/data_sources/cart_data_source.dart';
import 'package:farmacy_app/features/home/data/data_sources/categories_data_source.dart';
import 'package:farmacy_app/features/home/data/data_sources/medicien_data_source.dart';
import 'package:farmacy_app/features/home/data/models/add_item_to_cart_model.dart';
import 'package:farmacy_app/features/home/data/models/category_model.dart';
import 'package:farmacy_app/features/home/data/models/item_model.dart';
import 'package:farmacy_app/features/home/data/models/update_cart_item_model.dart';
import 'package:farmacy_app/features/home/data/repositories/cart_date_repo.dart';
import 'package:farmacy_app/features/home/data/repositories/categories_date_repo.dart';
import 'package:farmacy_app/features/home/data/repositories/medicien_date_repo.dart';
import 'package:farmacy_app/features/home/domain/repositories/catetgories_domain_repo.dart';
import 'package:farmacy_app/features/home/domain/repositories/medicien_domain_repo.dart';
import 'package:farmacy_app/features/home/domain/use_cases/cart_use_case.dart';
import 'package:farmacy_app/features/home/domain/use_cases/categories_use_case.dart';
import 'package:farmacy_app/features/home/domain/use_cases/medicine_use_case.dart';
import 'package:flutter/material.dart';

import '../../../data/models/add_item_to_cart_body.dart';
import '../../../domain/repositories/cart_domain_repo.dart';

class HomeProvider extends ChangeNotifier {
  final CategoriesDataSource categoriesDataSource;
  final MedicineDataSource medicineDataSource;
  final CartDataSource cartDataSource;

  HomeProvider(
      {required this.categoriesDataSource,
      required this.medicineDataSource,
      required this.cartDataSource});

  bool isLoading = false;
  bool getCategoriesSuccess = false;
  bool getMedicinesSuccess = false;
  bool addToCartSuccess = false;
  bool getAllCartItemsSuccess = false;
  int selectedMedicineItemToAddToCart = -1;
  int totalCartPrice = 0;
  List<CategoryModel> categories = [];
  List<SelectedCategoryItemModel> medicines = [];
  List<String> allAddedItemsToCartWithMedicineIdList = [];
  List<String> allAddedItemsToCartWithCartIdList = [];
  List<AddItemToCartModel> cartItems = [];
  AddItemToCartModel? addItemToCartModel;

  getAllCategories() async {
    log("getAllCategories called ========================");
    isLoading = true;

    CategoriesDomainRepo categoriesDomainRepo =
        CategoriesDataRepo(categoriesDataSource);
    CategoriesUseCase useCase =
        CategoriesUseCase(categoriesDomainRepo: categoriesDomainRepo);

    var result = await useCase.getCategories();
    print(" hllo hello" + result.length().toString());

    result.fold((l) {
      isLoading = false;
      getCategoriesSuccess = false;
      notifyListeners();
    }, (r) {
      categories = r;
      isLoading = false;
      getCategoriesSuccess = true;
      notifyListeners();
    });
  }

  Future getMedicinesById(String id) async {
    log("getMedicinesById called ========================");

    MedicineDomainRepo medicineDomainRepo =
        MedicineDataRepo(medicineDataSource);
    MedicineUseCase useCase =
        MedicineUseCase(medicineDomainRepo: medicineDomainRepo);
    var result = await useCase.getMedicinesByCategoryId(id);
    log(" hello hello${result.length()}");
    result.fold((l) {
      // isLoading = false;
      getMedicinesSuccess = false;
      notifyListeners();
    }, (r) {
      medicines = r;
      // isLoading = false;
      getMedicinesSuccess = true;
      notifyListeners();
    });
  }

  Future addItemToCart({required AddItemToCartBody addItemToCartBody}) async {
    log("addItemToCart called ========================");
    isLoading = true;
    notifyListeners();
    CartDomainRepo cartDomainRepo = CartDataRepo(cartDataSource);
    CartUseCase useCase = CartUseCase(cartDomainRepo: cartDomainRepo);

    log("addItemToCart tow ========================");
    var result = await useCase.addItemToCart(addItemToCartBody);

    result.fold((l) {
      isLoading = false;
      addToCartSuccess = false;

      log("addItemToCart false ========================");
      notifyListeners();
    }, (r) {
      addItemToCartModel = r;
      isLoading = false;
      addToCartSuccess = true;
      allAddedItemsToCartWithCartIdList.add(r.cartItemId.toString());
      log("addItemToCart true ========================");

      notifyListeners();
    });
  }

  Future getAllCartItemsByUserId({required String userId}) async {
    log("getAllCartItemsByUserId called ========================");
    isLoading = true;
    CartDomainRepo cartDomainRepo = CartDataRepo(cartDataSource);
    CartUseCase useCase = CartUseCase(cartDomainRepo: cartDomainRepo);

    log("getAllCartItemsByUserId tow ========================");
    var result = await useCase.getAllCartItemsByUseID(userId);
    log("getAllCartItemsByUserId three ========================");

    result.fold((l) {
      isLoading = false;
      getAllCartItemsSuccess = false;
      notifyListeners();
      log("getAllCartItemsByUserId false ========================");
      notifyListeners();
    }, (r) {
      cartItems = r;
      isLoading = false;
      getAllCartItemsSuccess = true;
      log("getAllCartItemsByUserId true ========================");
      if(cartItems.isNotEmpty){
        totalCartPrice = cartItems.map((e) {
          if (e.medicineId == null) return 0;
          return e.medicineId! * e.itemQuantity!;
        }).reduce((value, element) => value + element);
      }
      log("totalCartPrice = $totalCartPrice >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      notifyListeners();
    });
  }

  Future updateCartItem(UpdateCartItemModel updateCartItemModel) async {
    log("updateCartItem called ========================");
    notifyListeners();
    var result = await cartDataSource.updateCartItem(updateCartItemModel);
    log("updateCartItem tow ========================");

    result.fold((l) {
      log("updateCartItem failed ========================");
    }, (r) {
      log("updateCartItem Success ========================");
    });
  }

  Future deleteCartItem(String cartId) async {
    log("deleteCartItem called ========================");
    var result = await cartDataSource.deleteCartItem(cartId);
    log("deleteCartItem tow ========================");
    result.fold((l) {}, (r) {
      notifyListeners();
      log("deleteCartItem success ========================");
    });
  }
}