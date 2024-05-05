
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:farmacy_app/features/RegisterScreen/data/models/register_body.dart';
import 'package:farmacy_app/features/RegisterScreen/data/repositories/register_data_repo.dart';
import 'package:farmacy_app/features/RegisterScreen/domain/use_cases/register_user_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../data/data_sources/register_data_source.dart';
import '../../../data/models/register_mode.dart';

class RegisterProvider extends ChangeNotifier {

  RegisterProvider({required this.registerDataSource}) ;
  RegisterDataSource registerDataSource;


 // late dynamic responseResult ;
  final formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var obscureText = true;
  var confirmPassword = false;
  var flutterPwValidator = false;
  var showLoading = false;
  var registerSuccess = false;
  String? registerSuccessMessage;
  String? registerFailureMessage = "failure";

  bool _isObscure = true;
  bool get isObscure => _isObscure;
  void changeObscure() {
    _isObscure = !_isObscure;
    notifyListeners();
  }
  
  registerUser()async {
    var registerDomainRepo = RegisterDataRepo(registerDataSource: registerDataSource);
    var useCase = RegisterUserUseCase(registerDomainRepo: registerDomainRepo);

    print("call call call");
    print("${emailController.value.text}");
    print("${passController.value.text}");
    print("${userNameController.value.text}");
    var result = await useCase.call(RegisterBody(name: userNameController.value.text, email: emailController.value.text, password: passController.value.text));

    result.fold((l) {
      registerSuccess = false;
      registerFailureMessage = l.message;
      notifyListeners();

    }, (r) {
      registerSuccess = true;
       registerSuccessMessage = r.message;
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
