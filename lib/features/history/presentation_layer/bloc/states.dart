
abstract class HistoryStates{}

class InitialState extends HistoryStates{}
class LoadingState extends HistoryStates{}
class SuccessState extends HistoryStates{
  var data;
  SuccessState(this.data);
}
class SuccessBoolState extends HistoryStates{}

class ErrorState extends HistoryStates{
  String failure;
  ErrorState(this.failure);
}

