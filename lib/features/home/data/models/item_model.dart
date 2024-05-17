// class SelectedCategoryItemModel{
//
//
//   final String image;
//   final String name;
//   final String price;
//
//   SelectedCategoryItemModel({required this.image, required this.name, required this.price});
// }

class SelectedCategoryItemModel {
  int? medicineId;
  String? name;
  String? description;
  int? price;
  int? medicineQuantity;
  String? categoryName;

  SelectedCategoryItemModel(
      {this.medicineId,
        this.name,
        this.description,
        this.price,
        this.medicineQuantity,
        this.categoryName});

  SelectedCategoryItemModel.fromJson(Map<String, dynamic> json) {
    medicineId = json['medicineId'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    medicineQuantity = json['medicineQuantity'];
    categoryName = json['categoryName'];
  }

}
