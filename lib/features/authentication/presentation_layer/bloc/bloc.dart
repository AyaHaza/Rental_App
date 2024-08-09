import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain_layer/usecases/signin_usecase.dart';
import '../../domain_layer/usecases/signup_usecase.dart';
import 'events.dart';
import 'states.dart';

class AuthBloc extends Bloc<AuthEvents,AuthStates>{
  SignUpUseCase signUpUseCase;
  SignInUseCase signInUseCase;

  AuthBloc(this.signUpUseCase,this.signInUseCase):super(InitialState()){

    on<RegisterEvent>((event, emit) async{
      emit(LoadingState());
      final result=await signUpUseCase.call(event.userEntity);
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
      final result=await signInUseCase.call(event.userEntity);
      result.fold(
              (failure){
            emit(ErrorState(failure.message));
          },
              (data){
            emit(SuccessState());
          }
      );
    });

    // on<RegisterWithGmailEvent>((event, emit) async{
    //   emit(LoadingState());
    //   final result=await AuthServiceImp().registerWithGamil();
    //   print(result);
    //   if(result== true ){
    //    emit(SuccessState());
    //   }else{
    //     emit(ErrorState(result.toString()));
    //   }
    // });

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