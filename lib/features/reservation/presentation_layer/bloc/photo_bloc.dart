import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain_layer/usecases/get_photo_usecase.dart';
import 'events.dart';
import 'states.dart';

class ReservationPhotosBloc extends Bloc<ReservationEvents,ReservationStates>{
  GetPhotoUsecase getPhotoUsecase;

  ReservationPhotosBloc(this.getPhotoUsecase):super(InitialState()){
    on<getPhotos>((event,emit)async{
      emit(LoadingState());
      var result=await getPhotoUsecase.call("Get photos");
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