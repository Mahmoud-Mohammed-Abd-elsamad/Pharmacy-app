class MedicineModel {
  String? name;
  String? description;
  String? price;
  String? medicineQuantity;
  String? categoryId;
  String? photo;

  MedicineModel(
      {this.name,
        this.description,
        this.price,
        this.medicineQuantity,
        this.categoryId,
        this.photo});

  MedicineModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    price = json['price'];
    medicineQuantity = json['medicineQuantity'];
    categoryId = json['categoryId'];
    photo = json['Photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['medicineQuantity'] = this.medicineQuantity;
    data['categoryId'] = this.categoryId;
    data['Photo'] = this.photo;
    return data;
  }
}
