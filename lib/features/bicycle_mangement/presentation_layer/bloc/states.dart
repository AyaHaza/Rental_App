
abstract class BicycleStates{}

class InitialState extends BicycleStates{}
class LoadingState extends BicycleStates{}
class SuccessState extends BicycleStates{
  var data;
  SuccessState(this.data);
}
class SuccessBoolState extends BicycleStates{}
class ErrorState extends BicycleStates{
  String failure;
  ErrorState(this.failure);
}

