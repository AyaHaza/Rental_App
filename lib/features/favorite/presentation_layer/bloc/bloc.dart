import 'package:bloc/bloc.dart';

import '../../domain_layer/usecases/add_to_favorite_usecase.dart';
import '../../domain_layer/usecases/get_favorite_usecase.dart';
import 'events.dart';
import 'states.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  GetFavoriteUsecase getFavoriteUsecase;
  AddToFavoriteUsecase addToFavoriteUsecase;

  FavouriteBloc(this.getFavoriteUsecase,this.addToFavoriteUsecase) : super(FavouriteInitial()) {
    on<GetFavorite>((event, emit) async {
      emit(LoadingState());
      var result =
      await getFavoriteUsecase.call('get');
      result.fold((failure) {
        emit(ErrorState(failure: failure.message));
      }, (data) {
        emit(SuccessState(data: data));
      });
    });

    on<AddToFavorite>((event, emit) async {
      emit(LoadingState());
      var result = await addToFavoriteUsecase.call(event.bicycleId);
      result.fold((failure) {
        emit(ErrorState(failure: failure.message));
      }, (data) {
        emit(SuccessState(data: data));
      });
    });

  }
}
