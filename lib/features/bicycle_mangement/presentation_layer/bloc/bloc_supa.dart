import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain_layer/usecases/add_bicycle_supa_usecase.dart';
import '../../domain_layer/usecases/delete_bicycle_supa_usecase.dart';
import '../../domain_layer/usecases/edit_bicycle_Supa_usecase.dart';
import '../../domain_layer/usecases/get_bicyles_supa_usecase.dart';
import 'events.dart';
import 'states.dart';


class BicycleSupaBloc extends Bloc<BicycleEvents,BicycleStates>{
  AddBicycleSupaUsecase addBicycleSupaUsecase;
  EditBicycleSupaUsecase editBicycleSupaUsecase;
  GetBicylesSupaUsecase getBicylesSupaUsecase;
  DeleteBicycleSupaUsecase deleteBicycleSupaUsecase;

  BicycleSupaBloc(this.addBicycleSupaUsecase,this.editBicycleSupaUsecase,this.getBicylesSupaUsecase,this.deleteBicycleSupaUsecase):super(InitialState()){

    on<AddBicycleSupa>((event, emit)async{
      emit(LoadingState());
      final resultSupa=await addBicycleSupaUsecase.call(event.bicycleSupaEntity);
      resultSupa.fold(
              (failure){
            emit(ErrorState(failure.message));
          },
              (data){
            emit(SuccessState(true));
          }
      );
    });

    on<EditBicycleSupa>((event, emit)async{
      emit(LoadingState());
      final resultSupa=await editBicycleSupaUsecase.call(event.id,event.bicycleSupaEntity);
      resultSupa.fold(
              (failure){
            emit(ErrorState(failure.message));
          },
              (data){
            emit(SuccessState(true));
          }
      );
    });

    on<GetBicycleEvent>((event, emit)async{
      emit(LoadingState());
      final resultSupa=await getBicylesSupaUsecase.call('get');
      resultSupa.fold(
              (failure){
            emit(ErrorState(failure.message));
          },
              (data){
            emit(SuccessState(data));
          }
      );
    });


    on<DeleteBicycleSupa>((event, emit)async{
      emit(LoadingState());
      final resultSupa=await deleteBicycleSupaUsecase.call(event.id);
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