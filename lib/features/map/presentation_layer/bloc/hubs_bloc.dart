import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain_layer/usecases/get_hubs_usecase.dart';
import 'events.dart';
import 'states.dart';


class MapHubsBloc extends Bloc<MapEvents,MapStates>{
  GetHubsUsecase getHubsUsecase;

  MapHubsBloc(this.getHubsUsecase):super(InitialState()){
    on<GetHubsEvent>((event, emit)async{
      final result=await getHubsUsecase.call(event.currentLocation);
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