import 'package:flutter_bloc/flutter_bloc.dart';
import '../service/map_service.dart';
import 'events.dart';
import 'states.dart';

class MapHubsBloc extends Bloc<MapEvents,MapStates>{
  MapHubsBloc():super(InitalState()){

    on<GetHubs>((event, emit)async{
      final result=await MapService().getHubs(event.currentLocation);
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