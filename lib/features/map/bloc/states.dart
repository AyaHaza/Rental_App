
abstract class MapStates {}

class InitalState extends MapStates{
}
class LoadingStates extends MapStates{}
class ErrorState extends MapStates{
  String failure;
  ErrorState(this.failure);
}

class SuccessState extends MapStates{
  var data;
  SuccessState(this.data);
}

