
abstract class ReservationStates{}

class InitialState extends ReservationStates{}
class LoadingState extends ReservationStates{}
class SuccessState extends ReservationStates{
  var data;
  SuccessState(this.data);
}
class ErrorState extends ReservationStates{
  String failure;
  ErrorState(this.failure);
}

