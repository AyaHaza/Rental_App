import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../models/post_favourite_model.dart';
import '../service/favourite_service.dart';
part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(FavouriteInitial()) {
    on<GetFavouriteItemEvent>((event, emit) async {
      emit(LoadingState());
      var result =
          await FavouriteServiceImp().getFavouriteItemforUser(event.bicyleId);
      result.fold((failure) {
        emit(ErrorState(failure: failure.message));
      }, (data) {
        emit(SuccessState(data: data));
      });
    });

    on<addFavouruteEvent>((event, emit) async {
      emit(LoadingState());
      var result = await FavouriteServiceImp()
          .addNewFavouriteItem(event.postFavouriteModel, event.bicyleId);
      result.fold((failure) {
        emit(ErrorState(failure: failure.message));
      }, (data) {
        emit(SuccessState(data: data));
      });
    });

    on<deleteFavouriteItemEvent>((event, emit) async {
      emit(LoadingState());
      var result = await FavouriteServiceImp()
          .deleteFavouriteItem(event.id);
      result.fold((failure) {
        emit(ErrorState(failure: failure.message));
      }, (data) {
        emit(SuccessState(data: data));
      });
    });
  }
}
