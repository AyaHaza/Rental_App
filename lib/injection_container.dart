import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rental_clean_tdd/features/authentication/presentation_layer/bloc/bloc.dart';
import 'features/authentication/data_layer/data_source/remote/auth_api_service.dart';
import 'features/authentication/data_layer/data_source/remote/auth_api_service_imp.dart';
import 'features/authentication/data_layer/repository/authentication_repository_imp.dart';
import 'features/authentication/domain_layer/repository/authentication_repository.dart';
import 'features/authentication/domain_layer/usecases/signin_usecase.dart';
import 'features/authentication/domain_layer/usecases/signup_usecase.dart';

final sl=GetIt.instance;

Future <void> initializeDependencies()async{
  sl.registerSingleton<Dio>(Dio());

  //Authentication
  sl.registerSingleton<AuthApiService>(AuthApiServiceImp());
  sl.registerSingleton<AuthenticationRepository>(AuthenticationRepositoryImp(sl()));
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase(sl()));
  sl.registerSingleton<SignInUseCase>(SignInUseCase(sl()));
  sl.registerFactory<AuthBloc>(()=>AuthBloc(sl(), sl()));

}