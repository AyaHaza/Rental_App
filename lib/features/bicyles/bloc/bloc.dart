import 'package:flutter_bloc/flutter_bloc.dart';
import '../service/bcycle_service.dart';
import 'events.dart';
import 'states.dart';


class BicycleBloc extends Bloc<BicycleEvents,BicycleStates>{

  BicycleBloc():super(InitialState()){
    on<GetBicycleEvent>((event, emit)async{
      emit(LoadingState());
      final resultSupa=await BicyleService().getBicyles();
      resultSupa.fold(
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