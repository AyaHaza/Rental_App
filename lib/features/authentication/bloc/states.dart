


abstract class AuthStates{}

class InitialState extends AuthStates{}
class LoadingState extends AuthStates{}
class SuccessState extends AuthStates{}
class ErrorState extends AuthStates{
  String failure;
  ErrorState(this.failure);
}