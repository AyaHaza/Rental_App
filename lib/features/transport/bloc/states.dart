
abstract class TransportStates{}

class InitialState extends TransportStates{}
class LoadingState extends TransportStates{}
class SuccessState extends TransportStates{
  var data;
  SuccessState(this.data);
}
class ErrorState extends TransportStates{
  String failure;
  ErrorState(this.failure);
}

