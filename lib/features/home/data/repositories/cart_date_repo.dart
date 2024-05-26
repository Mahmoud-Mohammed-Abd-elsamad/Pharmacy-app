import 'package:dartz/dartz.dart';
import 'package:farmacy_app/core/error/failures.dart';
import 'package:farmacy_app/features/home/data/data_sources/cart_data_source.dart';
import 'package:farmacy_app/features/home/data/data_sources/categories_data_source.dart';
import 'package:farmacy_app/features/home/data/models/add_item_to_cart_body.dart';
import 'package:farmacy_app/features/home/data/models/add_item_to_cart_model.dart';
import 'package:farmacy_app/features/home/data/models/category_model.dart';
import 'package:farmacy_app/features/home/domain/repositories/catetgories_domain_repo.dart';

import '../../domain/repositories/cart_domain_repo.dart';
import '../models/get_all_cart_items_model.dart';

class CartDataRepo extends CartDomainRepo{
  CartDataRepo(this.cartDataSource);

  CartDataSource cartDataSource;
  @override
  Future<Either<FailureError, AddItemToCartModel>> addItemToCart(AddItemToCartBody addItemToCartBody) {
   return cartDataSource.addItemToCart(addItemToCartBody);
  }

  @override
  Future<Either<FailureError, List<MedicineCartModel>>> getAllCartItemsByUseID(String userID) {

   return  cartDataSource.getAllCartItemsByUseID(userID);
  }


}