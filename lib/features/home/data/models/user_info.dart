
class UserInfo {
  int? id;
  String? fullName;
  int? phoneNumber;
  String? email;
  bool? isAdmin;

  UserInfo(
      {this.id, this.fullName, this.phoneNumber, this.email, this.isAdmin});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    isAdmin = json['isAdmin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['phoneNumber'] = this.phoneNumber;
    data['email'] = this.email;
    data['isAdmin'] = this.isAdmin;
    return data;
  }
}
