import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:farmacy_app/core/error/failures.dart';
import 'package:farmacy_app/features/forget_password_screen/data/data_sources/forget_passord_data_sources.dart';
import 'package:farmacy_app/features/forget_password_screen/data/models/forget_password_model.dart';
import 'package:farmacy_app/features/forget_password_screen/data/models/reset_password_body.dart';
import 'package:farmacy_app/features/forget_password_screen/data/repositories/forget_passord_data_repo.dart';
import 'package:farmacy_app/features/forget_password_screen/domain/repositories/forget_password_doman_repo.dart';
import 'package:farmacy_app/features/forget_password_screen/domain/use_cases/reset_password_use_case.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/use_cases/foret_password_use_case.dart';

class ForgetPasswordProvider extends ChangeNotifier {
  ForgetPasswordDataSource forgetPasswordDataSource;

  ForgetPasswordProvider({required this.forgetPasswordDataSource});

  final forgetPasswordFormKey = GlobalKey<FormState>();
  final verificationPasswordFormKey = GlobalKey<FormState>();
  final resetPasswordFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isResetPasswordSuccess = false;
  bool isOtpSendSuccess = false;
  String isResetPasswordMessage = "";
  bool showVerificationCode = false;
  bool showResetPassword = false;
  var otpControllerList = List.generate(6, (index) => TextEditingController());

  bool _isObscure = true;

  bool get isObscure => _isObscure;

  void changeObscure() {
    print("login clced icon");
    log("login clced icon");
    _isObscure = !_isObscure;
    notifyListeners();
  }
  bool _isObscureConfirmPasswordText = true;

  bool get isObscureConfirmPasswordText => _isObscureConfirmPasswordText;

  void changeObscureConfirmPasswordText() {
    print("login clced icon");
    log("login clced icon");
    _isObscureConfirmPasswordText = !_isObscureConfirmPasswordText;
    notifyListeners();
  }

  Future<Either<FailureError, ForgetPasswordModel>?> forgetPassword() async {
    ForgetPasswordDomainRepo forgetPasswordDomainRepo = ForgetPasswordDataRepo(
        forgetPasswordDataSource: forgetPasswordDataSource);
    var useCase = ForgetPasswordUseCase(
        forgetPasswordDomainRepo: forgetPasswordDomainRepo);

    var result = await useCase.forgetPassword(emailController.text);

    result.fold((l) {

       isOtpSendSuccess = false;
       log(">>>>>>>>>>>>>>>>>>>>>>>>> $isOtpSendSuccess");


       return FailureError(l.message);
    }, (r) {
       isOtpSendSuccess = true;
       log(">>>>>>>>>>>>>>>>>>>>>>>>> $isOtpSendSuccess");

      return ForgetPasswordModel(message: r.message);
    });
  }
  resetPassword() async {
    ForgetPasswordDomainRepo forgetPasswordDomainRepo = ForgetPasswordDataRepo(
        forgetPasswordDataSource: forgetPasswordDataSource);
    var useCase = ResetPasswordUseCase(
        forgetPasswordDomainRepo: forgetPasswordDomainRepo);
    print("otp >> ${otpControllerList.map((e) => e.value.text).join()}");

    var result = await useCase.resetPassword(ResetPasswordBody(email:emailController.value.text,otp:otpControllerList.map((e) => e.value.text).join(),newPassword:passwordController.value.text));

    result.fold((l) {
      isResetPasswordSuccess = false;
      isResetPasswordMessage = l.message;
      log(isResetPasswordMessage + " MESSAGE");

      log("isResetPasswordSuccess $isResetPasswordSuccess");

      return FailureError(l.message);
    }, (r) {
      isResetPasswordSuccess = true;
      isResetPasswordMessage = r.message ?? " invalid otp";

      log(isResetPasswordMessage + " MESSAGE");
      log("isResetPasswordSuccess $isResetPasswordSuccess");
      return ForgetPasswordModel(message: r.message);
    });
  }

  otpVerification() {
    if (verificationPasswordFormKey
        .currentState!
        .validate()) {
      showResetPassword = true;
      showVerificationCode = false;

      print("done otp code verification");
      print(" verification ${showVerificationCode}");
      print(" isResetPassword ${showResetPassword}");
      notifyListeners();
    }

  }
}
