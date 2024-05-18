import 'package:dartz/dartz.dart';
import 'package:farmacy_app/core/error/failures.dart';
import 'package:farmacy_app/features/home/data/models/add_item_to_cart_model.dart';

import '../../data/models/add_item_to_cart_body.dart';
import '../../data/models/category_model.dart';
import '../../data/models/item_model.dart';

abstract class CartDomainRepo{

  Future<Either<FailureError, AddItemToCartModel>> addItemToCart(AddItemToCartBody addItemToCartBody) ;
  Future<Either<FailureError, List<AddItemToCartModel>>> getAllCartItemsByUseID(
      String userID);

}