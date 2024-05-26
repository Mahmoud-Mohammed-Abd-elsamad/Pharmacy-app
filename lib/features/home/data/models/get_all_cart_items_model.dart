class MedicineCartModel {
  int? cartItemId;
  int? userId;
  int? medicineId;
  int? itemQuantity;
  String? medicineName;
  String? medicineDescription;
  int? medicinePrice;
  int? medicineQuantity;
  String? medicineCategoryName;
  String? medicinePhoto;

  MedicineCartModel(
      {this.cartItemId,
        this.userId,
        this.medicineId,
        this.itemQuantity,
        this.medicineName,
        this.medicineDescription,
        this.medicinePrice,
        this.medicineQuantity,
        this.medicineCategoryName,
        this.medicinePhoto});

  MedicineCartModel.fromJson(Map<String, dynamic> json) {
    cartItemId = json['cartItemId'];
    userId = json['userId'];
    medicineId = json['medicineId'];
    itemQuantity = json['itemQuantity'];
    medicineName = json['medicineName'];
    medicineDescription = json['medicineDescription'];
    medicinePrice = json['medicinePrice'];
    medicineQuantity = json['medicineQuantity'];
    medicineCategoryName = json['medicineCategoryName'];
    medicinePhoto = json['medicinePhoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cartItemId'] = this.cartItemId;
    data['userId'] = this.userId;
    data['medicineId'] = this.medicineId;
    data['itemQuantity'] = this.itemQuantity;
    data['medicineName'] = this.medicineName;
    data['medicineDescription'] = this.medicineDescription;
    data['medicinePrice'] = this.medicinePrice;
    data['medicineQuantity'] = this.medicineQuantity;
    data['medicineCategoryName'] = this.medicineCategoryName;
    data['medicinePhoto'] = this.medicinePhoto;
    return data;
  }
}
