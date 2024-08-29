// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favourite_bloc.dart';

sealed class FavouriteState extends Equatable {
  const FavouriteState();

  @override
  List<Object> get props => [];
}

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
