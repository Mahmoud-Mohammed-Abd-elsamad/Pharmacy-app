
import 'package:image_picker/image_picker.dart';

class MedicineBody {

 final String? id;
 final String name;
 final String description;
 final String price;
 final String medicineQuantity;
 final  String categoryId;
 final  XFile? photo;

  MedicineBody({
    this.id,
    required this.name,
    required   this.description,
    required   this.price,
    required   this.medicineQuantity,
    required   this.categoryId,required this.photo});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['Quantity'] = this.medicineQuantity;
    data['categoryId'] = this.categoryId;
    data['Photo'] = this.photo;
    return data;
  }
}
