class LoginModel {
  int? id;
  bool? isAdmin;
  int? phoneNumber;
  String? fullName;
  String? email;
  String? token;

  LoginModel(
      {this.id,
        this.isAdmin,
        this.phoneNumber,
        this.fullName,
        this.email,
        this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isAdmin = json['isAdmin'];
    phoneNumber = json['phoneNumber'];
    fullName = json['fullName'];
    email = json['email'];
    token = json['token'];
  }

}

