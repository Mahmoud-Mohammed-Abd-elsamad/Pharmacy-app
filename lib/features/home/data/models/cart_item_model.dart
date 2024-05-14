class CartItemModel {


  final String image;
  final String name;
  final String price;
  final bool isRemoved;

  const CartItemModel(this.isRemoved, {required this.image, required this.name, required this.price});
}