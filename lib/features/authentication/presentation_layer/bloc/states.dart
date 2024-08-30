
abstract class AuthStates{}

class InitialState extends AuthStates{}
class LoadingState extends AuthStates{}
class SuccessStatee extends AuthStates{
  var data;
  SuccessStatee(this.data);
}
class SuccessBoolStatee extends AuthStates{
}
class ErrorStatee extends AuthStates{
  String failure;
  ErrorStatee(this.failure);
}

