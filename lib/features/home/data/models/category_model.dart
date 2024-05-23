class CategoryModel {
 int? categoryId;
 String? name;
 String? photo;

 CategoryModel({this.categoryId, this.name, this.photo});

 CategoryModel.fromJson(Map<String, dynamic> json) {
  categoryId = json['categoryId'];
  name = json['name'];
  photo = json['photo'];
 }

}
