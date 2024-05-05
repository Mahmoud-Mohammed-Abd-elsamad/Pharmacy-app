class FailureError{

  final String errorMessage;

  FailureError(this.errorMessage);

  @override
  String toString() {
    // TODO: implement toString
    return errorMessage;
  }
}

class RemoteFailure extends FailureError{
  RemoteFailure(super.errorMessage);

}

class CashFailure extends FailureError{
  CashFailure(super.errorMessage);

}