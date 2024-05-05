import 'package:farmacy_app/features/login_screen/data/data_sources/login_user_data_source.dart';
import 'package:farmacy_app/features/login_screen/data/models/login_body.dart';
import 'package:farmacy_app/features/login_screen/data/repositories/login_data_repo.dart';
import 'package:farmacy_app/features/login_screen/domain/use_cases/login_user_use_case.dart';
import 'package:flutter/material.dart';

import '../../domain/repositories/login_domain_repo.dart';

class LoginProvider extends ChangeNotifier {
  LoginProvider({required this.loginUserDataSource});
   LoginUserDataSource loginUserDataSource;


  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  var obscureText = true;
  var confirmPassword = false;
  var flutterPwValidator = false;
  var showLoading = false;
  var loginSuccess = false;
  String? loginSuccessMessage;
  String? loginFailureMessage = "failure";

  bool _isObscure = true;
  bool get isObscure => _isObscure;
  void changeObscure() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  registerUser()async {

    LoginDomainRepo loginDomainRepo = LoginDataRepo(loginUserDataSource: loginUserDataSource);
   var useCase = LoginUserUseCase(loginDomainRepo: loginDomainRepo);

    print("call call call");
    print("${emailController.value.text}");
    print("${passController.value.text}");
    var result = await useCase.call(LoginBody(email: emailController.value.text, password: passController.value.text));

    result.fold((l) {
      loginSuccess = false;
      loginFailureMessage = l.message;
      notifyListeners();

    }, (r) {
      loginSuccess = true;
      loginSuccessMessage = r.fullName;
      notifyListeners();


    });

  }

  void confirmPasswordFunction(String value) {
    if (value == passController.text) {
      confirmPassword = true;
    } else {
      confirmPassword = false;
    }
  }

}
