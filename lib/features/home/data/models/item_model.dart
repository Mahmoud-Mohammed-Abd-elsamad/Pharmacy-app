class SelectedCategoryItemModel {
  int? medicineId;
  String? name;
  String? description;
  int? price;
  int? medicineQuantity;
  String? categoryName;
  String? photo;

  SelectedCategoryItemModel(
      {this.medicineId,
        this.name,
        this.description,
        this.price,
        this.medicineQuantity,
        this.categoryName,
        this.photo});

  SelectedCategoryItemModel.fromJson(Map<String, dynamic> json) {
    medicineId = json['medicineId'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    medicineQuantity = json['medicineQuantity'];
    categoryName = json['categoryName'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['medicineId'] = this.medicineId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['medicineQuantity'] = this.medicineQuantity;
    data['categoryName'] = this.categoryName;
    data['photo'] = this.photo;
    return data;
  }
}
