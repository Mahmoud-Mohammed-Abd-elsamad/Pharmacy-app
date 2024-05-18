class UpdateCartItemModel {
  int? cartItemId;
  int? userId;
  int? medicineId;
  int? itemQuantity;

  UpdateCartItemModel(
      {required this.cartItemId,required this.userId,required this.medicineId,required this.itemQuantity});

  UpdateCartItemModel.fromJson(Map<String, dynamic> json) {
    cartItemId = json['cartItemId'];
    userId = json['userId'];
    medicineId = json['medicineId'];
    itemQuantity = json['itemQuantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cartItemId'] = cartItemId;
    data['userId'] = userId;
    data['medicineId'] = medicineId;
    data['itemQuantity'] = itemQuantity;
    return data;
  }
}
