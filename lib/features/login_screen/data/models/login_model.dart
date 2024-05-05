class LoginMoel {
  int? id;
  String? fullName;
  String? email;
  String? token;

  LoginMoel({this.id, this.fullName, this.email, this.token});

  LoginMoel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    email = json['email'];
    token = json['token'];
  }
}
