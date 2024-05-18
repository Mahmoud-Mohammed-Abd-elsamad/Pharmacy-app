class AddItemToCartBody{

  final String userId;
  final String medicineId;
  final String itemQuantity;

  AddItemToCartBody({required this.userId, required this.medicineId, required this.itemQuantity});

  Map<String,dynamic> toJson(){
    return  {
      "UserId": userId,
      "MedicineId": medicineId,
      "ItemQuantity": itemQuantity
    };
  }
}