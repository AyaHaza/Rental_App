import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:rental_app/features/map/bloc/events.dart';
import 'package:rental_app/features/map/bloc/states.dart';
import 'package:rental_app/models/hub_model.dart';
import '../service/map_service.dart';

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
            add(GetHubs(data, event.context));
          }
      );
    });

    on<GetHubs>((event, emit)async{
      final result=await MapService().getHubs(event.currentLocation,event.context);
      result.fold(
        (failure){
        emit(ErrorState(failure.message));
        },
        (data){
          // emit(SuccessState(data));
        }
      );
    });


  }
}