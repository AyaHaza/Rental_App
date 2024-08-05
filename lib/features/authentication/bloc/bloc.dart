import 'package:flutter_bloc/flutter_bloc.dart';
import '../service/auth_service.dart';
import 'events.dart';
import 'states.dart';

class AuthBloc extends Bloc<AuthEvents,AuthStates>{

  AuthBloc():super(InitialState()){

    on<RegisterEvent>((event, emit) async{
      emit(LoadingState());
      print(event.userModel.username);
      final result=await AuthServiceImp().register(event.userModel);
      result.fold(
         (failure){
           emit(ErrorState(failure.message));
         },
           (data){
           emit(SuccessState());
         }
       );
    });

    on<LoginEvent>((event, emit) async{
      emit(LoadingState());
      final result=await AuthServiceImp().login(event.userModel);
      result.fold(
              (failure){
            emit(ErrorState(failure.message));
          },
              (data){
            emit(SuccessState());
          }
      );
    });

    on<RegisterWithGmailEvent>((event, emit) async{
      emit(LoadingState());
      final result=await AuthServiceImp().registerWithGamil();
      print(result);
      if(result== true ){
       emit(SuccessState());
      }else{
        emit(ErrorState(result.toString()));
      }
    });

    // on<RegisterWithFacebookEvent>((event, emit) async{
    // emit(LoadingState());
    // final result=await AuthServiceImp().registerWithFacebook();
    // print(result);
    // if(result== true ){
    // emit(SuccessState());
    // }else{
    // emit(ErrorState(result.toString()));
    // }
    // });
  }
}