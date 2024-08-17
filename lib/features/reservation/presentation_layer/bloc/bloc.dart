import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain_layer/usecases/get_bicycle_by_category_usecase.dart';
import '../../domain_layer/usecases/get_bicycle_category_usecase.dart';
import '../../domain_layer/usecases/get_bicycle_details_usecase.dart';
import '../../domain_layer/usecases/get_hub_content_usecase.dart';
import '../../domain_layer/usecases/get_photo_usecase.dart';
import 'events.dart';
import 'states.dart';

class ReservationBloc extends Bloc<ReservationEvents,ReservationStates>{
  GetBicycleCategoryUsecase getBicycleCategoryUsecase;
  GetBicycleByCategoryUsecase getBicycleByCategoryUsecase;
  GetHubContentUsecase getHubContentUsecase;
  GetBicycleDetailsUsecase getBicycleDetailsUsecase;
  ReservationBloc(this.getBicycleCategoryUsecase,this.getBicycleByCategoryUsecase,this.getHubContentUsecase,this.getBicycleDetailsUsecase):super(InitialState()){

    on<getBicycleCategory>((event,emit)async{
      emit(LoadingState());
      var result=await getBicycleCategoryUsecase.call("Get bicycle category");
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
      var result=await getBicycleByCategoryUsecase.call(event.category);
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
      var result=await getHubContentUsecase.call(event.category,event.hudId);
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
      var result=await getBicycleDetailsUsecase.call(event.bicyleId);
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