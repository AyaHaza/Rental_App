import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain_layer/usecases/get_location_usecase.dart';
import 'events.dart';
import 'states.dart';


class MapLocationBloc extends Bloc<MapEvents,MapStates>{
  GetLocationUsecase getLocationUsecase;

  MapLocationBloc(this.getLocationUsecase):super(InitialState()){
    on<GetLocationEvent>((event, emit)async{
      emit(LoadingState());
      final result=await getLocationUsecase.call("get location");
      result.fold(
              (failure){
            emit(ErrorState(failure.message));
          },
              (data){
            emit(SuccessState(data));
          }
      );
    });
  }
}