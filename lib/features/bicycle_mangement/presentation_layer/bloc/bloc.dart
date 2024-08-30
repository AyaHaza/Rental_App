import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain_layer/usecases/get_bicyles_usecase.dart';
import 'events.dart';
import 'states.dart';


class BicycleBloc extends Bloc<BicycleEvents,BicycleStates>{
  GetBicylesUsecase getBicylesUsecase;
  BicycleBloc(this.getBicylesUsecase):super(InitialState()){
    on<GetBicycleEvent>((event, emit)async{
      emit(LoadingState());
      final resultSupa=await getBicylesUsecase.call('get');
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