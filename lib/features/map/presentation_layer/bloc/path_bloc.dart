import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain_layer/usecases/show_path_usecase.dart';
import 'events.dart';
import 'states.dart';

class ShowPathBloc extends Bloc<MapEvents,MapStates>{
  ShowPathUsecase showPathUsecase;

  ShowPathBloc(this.showPathUsecase):super(InitialState()){

    on<ShowPathEvent>((event, emit)async{
      emit(LoadingState());
      final resultSupa=await showPathUsecase.call(event.start,event.destination);
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