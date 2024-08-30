import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain_layer/usecases/add_profile_supa_usecase.dart';
import '../../domain_layer/usecases/edit_profile_supa_usecase.dart';
import '../../domain_layer/usecases/get_profile_supa_usecase.dart';
import '../../domain_layer/usecases/register_with_gamil_usecase.dart';
import '../../domain_layer/usecases/signin_usecase.dart';
import '../../domain_layer/usecases/signup_usecase.dart';
import 'events.dart';
import 'states.dart';

class AuthBloc extends Bloc<AuthEvents,AuthStates>{
  SignUpUseCase signUpUseCase;
  SignInUseCase signInUseCase;
  RegisterWithGamilUsecase registerWithGamilUsecase;
  GetProfileSupaUsecase getProfileSupaUsecase;
  AddProfileSupaUsecase addProfileSupaUsecase;
  EditProfileSupaUsecase editProfileSupaUsecase;
  AuthBloc(this.signUpUseCase,this.signInUseCase,this.registerWithGamilUsecase,this.getProfileSupaUsecase,this.addProfileSupaUsecase,this.editProfileSupaUsecase):super(InitialState()){

    on<RegisterEvent>((event, emit) async{
      emit(LoadingState());
      final result=await signUpUseCase.call(event.userEntity);
      result.fold(
         (failure){
           emit(ErrorStatee(failure.message));
         },
           (data){
           emit(SuccessStatee(data));
         }
       );
    });

    on<LoginEvent>((event, emit) async{
      emit(LoadingState());
      final result=await signInUseCase.call(event.userEntity);
      result.fold(
              (failure){
            emit(ErrorStatee(failure.message));
          },
              (data){
            emit(SuccessStatee(data));
          }
      );
    });

    on<ProfileEvent>((event, emit)async{
      emit(LoadingState());
      final resultSupa=await getProfileSupaUsecase.call(event.username);
      resultSupa.fold(
              (failure){
            emit(ErrorStatee(failure.message));
          },
              (data){
            emit(SuccessStatee(data));
          }
      );
    });

    on<AddProfileEvent>((event, emit)async{
      emit(LoadingState());
      final resultSupa=await addProfileSupaUsecase.call(event.userEntity);
      resultSupa.fold(
              (failure){
            emit(ErrorStatee(failure.message));
          },
              (data){
            emit(SuccessBoolStatee());
          }
      );
    });

    on<EditProfileEvent>((event, emit)async{
      emit(LoadingState());
      final resultSupa=await editProfileSupaUsecase.call(event.userEntity);
      resultSupa.fold(
              (failure){
            emit(ErrorStatee(failure.message));
          },
              (data){
            emit(SuccessBoolStatee());
          }
      );
    });


    on<RegisterWithGmailEvent>((event, emit) async{
      emit(LoadingState());
      final result=await registerWithGamilUsecase.call('gamil');
      result.fold(
              (failure){
            emit(ErrorStatee(failure.message));
          },
              (data){
            emit(SuccessStatee(data));
          }
      );
    });

  }
}