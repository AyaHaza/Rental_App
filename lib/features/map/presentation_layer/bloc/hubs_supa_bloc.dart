import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import '../../domain_layer/usecases/add_hubs_supa_usecase.dart';
import '../../domain_layer/usecases/delete_hubs_supa_usecase.dart';
import '../../domain_layer/usecases/edit_hubs_supa_usecase.dart';
import '../../domain_layer/usecases/get_hubs_supa_usecase.dart';
import 'events.dart';
import 'states.dart';


List listData=<SearchInfo>[];
class MapHubsSupaBloc extends Bloc<MapEvents,MapStates>{
  AddHubsSupaUsecase addHubsSupaUsecase;
  EditHubsSupaUsecase editHubsSupaUsecase;
  GetHubsSupaUsecase getHubsSupaUsecase;
  DeleteHubsSupaUsecase deleteHubsSupaUsecase;

  MapHubsSupaBloc(this.addHubsSupaUsecase,this.editHubsSupaUsecase,this.getHubsSupaUsecase,this.deleteHubsSupaUsecase):super(InitialState()){

    on<AddHubsSupaEvent>((event, emit)async{
      emit(LoadingState());
      final resultSupa=await addHubsSupaUsecase.call(event.hubsEntity);
      resultSupa.fold(
              (failure){
            emit(ErrorState(failure.message));
          },
              (data){
            emit(SuccessBoolState());
          }
      );
    });

    on<EditHubsSupaEvent>((event, emit)async{
      emit(LoadingState());
      final resultSupa=await editHubsSupaUsecase.call(event.id,event.hubsEntity);
      resultSupa.fold(
              (failure){
            emit(ErrorState(failure.message));
          },
              (data){
            emit(SuccessBoolState());
          }
      );
    });

    on<GetHubsSupaEvent>((event, emit)async{
      emit(LoadingState());
      final resultSupa=await getHubsSupaUsecase.call('get');
      resultSupa.fold(
              (failure){
            emit(ErrorState(failure.message));
          },
              (data){
            emit(SuccessState(data));
          }
      );
    });

    on<DeleteHubsSupaEvent>((event, emit)async{
      emit(LoadingState());
      final resultSupa=await deleteHubsSupaUsecase.call(event.id);
      resultSupa.fold(
              (failure){
            emit(ErrorState(failure.message));
          },
              (data){
            emit(SuccessBoolState());
          }
      );
    });

    on<AddToListEvent>((event, emit)async{
      listData.clear();
      listData=event.data;
      print(listData.length);
      emit(SuccessState(listData));
    });

  }
}