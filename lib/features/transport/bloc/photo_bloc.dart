import 'package:flutter_bloc/flutter_bloc.dart';
import '../service/transport_service.dart';
import 'events.dart';
import 'states.dart';

class TransportPhotoBloc extends Bloc<TransportEvents,TransportStates>{
  TransportPhotoBloc():super(InitialState()){
    on<getPhotos>((event,emit)async{
      emit(LoadingState());
      var result=await TransportService().getPhotos();
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