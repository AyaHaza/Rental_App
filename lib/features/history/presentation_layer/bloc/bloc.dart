import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../history/domain_layer/usecases/add_to_history_supa_usecase.dart';
import '../../domain_layer/usecases/delete_history_supa_usecase.dart';
import '../../domain_layer/usecases/get_history_supa_usecase.dart';
import 'events.dart';
import 'states.dart';

class HistoryBloc extends Bloc<HistoryEvent,HistoryStates>{
  AddToHistorySupaUsecase addToHistorySupaUsecase;
  GetHistorySupaUsecase getHistorySupaUsecase;
  DeleteHistorySupaUsecase deleteHistorySupaUsecase;

  HistoryBloc(this.addToHistorySupaUsecase,this.getHistorySupaUsecase,this.deleteHistorySupaUsecase):super(InitialState()){

    on<AddToHistoryEvent>((event, emit)async{
      emit(LoadingState());
      final resultSupa=await addToHistorySupaUsecase.call(event.historyEntity);
      resultSupa.fold(
              (failure){
            emit(ErrorState(failure.message));
          },
              (data){
            emit(SuccessState(data));
          }
      );
    });

    on<GetHistoryEvent>((event, emit)async{
      emit(LoadingState());
      final resultSupa=await getHistorySupaUsecase.call('get');
      resultSupa.fold(
              (failure){
            emit(ErrorState(failure.message));
          },
              (data){
            emit(SuccessState(data));
          }
      );
    });

    on<DeleteHistoryEvent>((event, emit)async{
      emit(LoadingState());
      final resultSupa=await deleteHistorySupaUsecase.call(event.id);
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