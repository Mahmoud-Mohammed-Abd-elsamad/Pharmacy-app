class RegisterModel {
  String? message;

  RegisterModel({this.message});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }


}
