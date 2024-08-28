import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_app/features/bicyles/view/add_bicycles.dart';
import '../service/bcycle_service.dart';
import 'events.dart';
import 'states.dart';


class BicycleSupaBloc extends Bloc<BicycleEvents,BicycleStates>{

  BicycleSupaBloc():super(InitialState()){

    on<AddBicycleSupa>((event, emit)async{
      emit(LoadingState());
      final resultSupa=await BicyleService().addBicycleSupa(event.bicycleSupaModel);
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
      final resultSupa=await BicyleService().editBicycleSupa(event.id,event.bicycleSupaModel);
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
      final resultSupa=await BicyleService().getBicylesSupa();
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
      final resultSupa=await BicyleService().deleteBicycleSupa(event.id);
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