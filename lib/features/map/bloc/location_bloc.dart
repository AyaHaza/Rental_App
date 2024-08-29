import 'package:flutter_bloc/flutter_bloc.dart';
import '../service/map_service.dart';
import 'events.dart';
import 'states.dart';

class MapBloc extends Bloc<MapEvents,MapStates>{
  MapBloc():super(InitalState()){

    on<GetLocation>((event, emit)async{
      emit(LoadingStates());
      final result=await MapService().getCurrentLocation();
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