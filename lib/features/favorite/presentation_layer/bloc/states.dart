
abstract class FavouriteState {}

final class FavouriteInitial extends FavouriteState {}

class LoadingState extends FavouriteState {}

class ErrorState extends FavouriteState {
  String failure;
  ErrorState({
    required this.failure,
  });
}

class SuccessState extends FavouriteState {
  var data;
  SuccessState({
    required this.data,
  });
}
