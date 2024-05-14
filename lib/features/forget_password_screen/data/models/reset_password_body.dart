class ResetPasswordBody {
  String? email;
  String? otp;
  String? newPassword;

  ResetPasswordBody({this.email, this.otp, this.newPassword});

  ResetPasswordBody.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    otp = json['Otp'];
    newPassword = json['NewPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['Otp'] = this.otp;
    data['NewPassword'] = this.newPassword;
    return data;
  }
}
