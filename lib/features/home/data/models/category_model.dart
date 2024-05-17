class CategoryModel {
 int? categoryId;
 String? name;
 String? image;

 CategoryModel({this.categoryId, this.name, this.image});

 CategoryModel.fromJson(Map<String, dynamic> json) {
  categoryId = json['categoryId'];
  name = json['name'];
  image = json['image'];
 }

}
