class FailureError{

  final String message;

  FailureError(this.message);

  @override
  String toString() {
    // TODO: implement toString

    return message;

  }
}

class RemoteFailure extends FailureError{
  RemoteFailure(super.message);

}

class CashFailure extends FailureError{
  CashFailure(super.message);

}