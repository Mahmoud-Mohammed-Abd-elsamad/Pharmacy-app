import 'package:dartz/dartz.dart';
import 'package:farmacy_app/features/home/domain/repositories/cart_domain_repo.dart';
import 'package:farmacy_app/features/home/domain/repositories/catetgories_domain_repo.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/add_item_to_cart_body.dart';
import '../../data/models/add_item_to_cart_model.dart';
import '../../data/models/get_all_cart_items_model.dart';

class CartUseCase{
CartUseCase({required this.cartDomainRepo});
 final CartDomainRepo cartDomainRepo;


Future<Either<FailureError, AddItemToCartModel>> addItemToCart(AddItemToCartBody addItemToCartBody) {
  return cartDomainRepo.addItemToCart(addItemToCartBody);


}

Future<Either<FailureError, List<MedicineCartModel>>> getAllCartItemsByUseID(
    String userID){

  return cartDomainRepo.getAllCartItemsByUseID(userID);
}


}