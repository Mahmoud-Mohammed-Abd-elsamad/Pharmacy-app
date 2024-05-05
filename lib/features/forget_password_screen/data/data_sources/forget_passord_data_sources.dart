abstract class ForgetPasswordDataSource {
  Future<void> forgetPassword({required String email});
}

class RemoteForgetPasswordDataSource extends ForgetPasswordDataSource {
  @override
  Future<void> forgetPassword({required String email}) async {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }
}

class LocalForgetPasswordDataSource extends ForgetPasswordDataSource {
  @override
  Future<void> forgetPassword({required String email}) {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }
}