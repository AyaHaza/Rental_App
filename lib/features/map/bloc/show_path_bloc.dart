import 'package:flutter_bloc/flutter_bloc.dart';
import '../service/map_service.dart';
import 'events.dart';
import 'states.dart';

class ShowPathBloc extends Bloc<MapEvents,MapStates>{
  ShowPathBloc():super(InitalState()){

    on<ShowPath>((event, emit)async{
      final resultSupa=await MapService().showPath(event.start,event.destination);
      resultSupa.fold(
              (failure){
            emit(ErrorState(failure.message));
          },
              (data){
            emit(SuccessState(data));
          }
      );
    });

    on<AddToHistory>((event, emit)async{
      final resultSupa=await MapService().addToHistorySupa(event.historyModel);
      resultSupa.fold(
              (failure){
            emit(ErrorState(failure.message));
          },
              (data){
            emit(SuccessState(data));
          }
      );
    });

    on<GetHistory>((event, emit)async{
      final resultSupa=await MapService().getHistorySupa();
      resultSupa.fold(
              (failure){
            emit(ErrorState(failure.message));
          },
              (data){
            emit(SuccessState(data));
          }
      );
    });

    on<DeleteHistory>((event, emit)async{
      final resultSupa=await MapService().deleteHistorySupa(event.id);
      resultSupa.fold(
              (failure){
            emit(ErrorState(failure.message));
          },
              (data){
            emit(SuccessBoolState());
          }
      );
    });

  }
}