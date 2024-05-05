class LoginModel {
  int? id;
  String? fullName;
  String? email;
  String? token;

  LoginModel({this.id, this.fullName, this.email, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    email = json['email'];
    token = json['token'];
  }
}
