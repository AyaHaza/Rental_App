import 'package:flutter_bloc/flutter_bloc.dart';
import '../service/transport_service.dart';
import 'events.dart';
import 'states.dart';

class TransportBloc extends Bloc<TransportEvents,TransportStates>{
  TransportBloc():super(InitialState()){
    on<getBicycleCategory>((event,emit)async{
      emit(LoadingState());
      var result=await TransportService().getBicycleCategory();
      result.fold(
              (failure){
            emit(ErrorState(failure.message));
          },
              (data){
            emit(SuccessState(data));
          }
      );
    });

    on<getBicycleByCategory>((event,emit)async{
      emit(LoadingState());
      var result=await TransportService().getBicycleByCategory(event.category);
      result.fold(
              (failure){
            emit(ErrorState(failure.message));
          },
              (data){
            emit(SuccessState(data));
          }
      );
    });

    on<getHubContent>((event,emit)async{
      emit(LoadingState());
      var result=await TransportService().getHubContent(event.category,event.hudId);
      result.fold(
              (failure){
            emit(ErrorState(failure.message));
          },
              (data){
            emit(SuccessState(data));
          }
      );
    });

    on<getBicycleDetail>((event,emit)async{
      emit(LoadingState());
      var result=await TransportService().getdetails(event.bicyleId);
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