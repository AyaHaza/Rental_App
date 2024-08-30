
abstract class MapStates{}

class InitialState extends MapStates{}
class LoadingState extends MapStates{}
class SuccessState extends MapStates{
  var data;
  SuccessState(this.data);
}
class SuccessBoolState extends MapStates{}

class ErrorState extends MapStates{
  String failure;
  ErrorState(this.failure);
}

