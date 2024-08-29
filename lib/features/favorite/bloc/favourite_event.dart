// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favourite_bloc.dart';

sealed class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object> get props => [];
}

class GetFavouriteItemEvent extends FavouriteEvent {
  int bicyleId;
  GetFavouriteItemEvent({
    required this.bicyleId,
  });
}

class addFavouruteEvent extends FavouriteEvent {
  int bicyleId;
  PostFavouriteModel postFavouriteModel;
  addFavouruteEvent({
    required this.bicyleId,
    required this.postFavouriteModel,
  });
}

class deleteFavouriteItemEvent extends FavouriteEvent{
  int id;
  deleteFavouriteItemEvent(this.id);
}