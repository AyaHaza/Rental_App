import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import '../service/map_service.dart';
import 'events.dart';
import 'states.dart';


List listData=<SearchInfo>[];
class MapHubsSupaBloc extends Bloc<MapEvents,MapStates>{
  MapHubsSupaBloc():super(InitalState()){

    on<AddHubsSupa>((event, emit)async{
      emit(LoadingStates());
      final resultSupa=await MapService().addHubsSupa(event.hubsModel);
      resultSupa.fold(
              (failure){
            emit(ErrorState(failure.message));
          },
              (data){
            emit(SuccessBoolState());
          }
      );
    });

    on<EditHubsSupa>((event, emit)async{
      emit(LoadingStates());
      final resultSupa=await MapService().editHubsSupa(event.id,event.hubsModel);
      resultSupa.fold(
              (failure){
            emit(ErrorState(failure.message));
          },
              (data){
            emit(SuccessBoolState());
          }
      );
    });
    
    on<GetHubsSupa>((event, emit)async{
      emit(LoadingStates());
      final resultSupa=await MapService().getHubsSupa();
      resultSupa.fold(
              (failure){
            emit(ErrorState(failure.message));
          },
              (data){
            emit(SuccessState(data));
          }
      );
    });

    on<DeleteHubsSupa>((event, emit)async{
      emit(LoadingStates());
      final resultSupa=await MapService().deleteHubsSupa(event.id);
      resultSupa.fold(
              (failure){
            emit(ErrorState(failure.message));
          },
              (data){
            emit(SuccessBoolState());
          }
      );
    });

    on<AddToList>((event, emit)async{
      listData.clear();
      listData=event.data;
      print(listData.length);
      emit(SuccessState(listData));
    });

  }
}