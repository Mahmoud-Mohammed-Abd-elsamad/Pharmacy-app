class AddItemToCartModel {
  int? cartItemId;
  int? userId;
  int? medicineId;
  int? itemQuantity;

  AddItemToCartModel(
      {this.cartItemId, this.userId, this.medicineId, this.itemQuantity});

  AddItemToCartModel.fromJson(Map<String, dynamic> json) {
    cartItemId = json['cartItemId'];
    userId = json['userId'];
    medicineId = json['medicineId'];
    itemQuantity = json['itemQuantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cartItemId'] = this.cartItemId;
    data['userId'] = this.userId;
    data['medicineId'] = this.medicineId;
    data['itemQuantity'] = this.itemQuantity;
    return data;
  }
}
