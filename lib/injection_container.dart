import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'features/authentication/data_layer/data_source/remote/auth_api_service.dart';
import 'features/authentication/data_layer/data_source/remote/auth_api_service_imp.dart';
import 'features/authentication/data_layer/repository/authentication_repository_imp.dart';
import 'features/authentication/domain_layer/repository/authentication_repository.dart';
import 'features/authentication/domain_layer/usecases/signin_usecase.dart';
import 'features/authentication/domain_layer/usecases/signup_usecase.dart';
import 'features/authentication/presentation_layer/bloc/bloc.dart';
import 'features/map/data_layer/data_source/remote/map_api_service.dart';
import 'features/map/data_layer/data_source/remote/map_api_service_imp.dart';
import 'features/map/data_layer/repository/map_repository_imp.dart';
import 'features/map/domain_layer/repository/map_repository.dart';
import 'features/map/domain_layer/usecases/get_hubs_usecase.dart';
import 'features/map/domain_layer/usecases/get_location_usecase.dart';
import 'features/map/presentation_layer/bloc/hubs_bloc.dart';
import 'features/map/presentation_layer/bloc/location_bloc.dart';
import 'features/reservation/data_layer/data_source/remote/reservation_api_service.dart';
import 'features/reservation/data_layer/data_source/remote/reservation_api_service_imp.dart';
import 'features/reservation/data_layer/repository/reservation_repository_imp.dart';
import 'features/reservation/domain_layer/repository/reservation_repository.dart';
import 'features/reservation/domain_layer/usecases/get_bicycle_by_category_usecase.dart';
import 'features/reservation/domain_layer/usecases/get_bicycle_category_usecase.dart';
import 'features/reservation/domain_layer/usecases/get_bicycle_details_usecase.dart';
import 'features/reservation/domain_layer/usecases/get_hub_content_usecase.dart';
import 'features/reservation/domain_layer/usecases/get_photo_usecase.dart';
import 'features/reservation/presentation_layer/bloc/bloc.dart';
import 'features/reservation/presentation_layer/bloc/photo_bloc.dart';

final sl=GetIt.instance;

Future <void> initializeDependencies()async{
  sl.registerSingleton<Dio>(Dio());

  //Authentication
  sl.registerSingleton<AuthApiService>(AuthApiServiceImp(sl()));
  sl.registerSingleton<AuthenticationRepository>(AuthenticationRepositoryImp(sl()));
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase(sl()));
  sl.registerSingleton<SignInUseCase>(SignInUseCase(sl()));
  sl.registerFactory<AuthBloc>(()=>AuthBloc(sl(), sl()));


  //map
  sl.registerSingleton<MapApiService>(MapApiServiceImp(sl()));
  sl.registerSingleton<MapRepository>(MapRepositoryImp(sl()));
  sl.registerSingleton<GetLocationUsecase>(GetLocationUsecase(sl()));
  sl.registerSingleton<GetHubsUsecase>(GetHubsUsecase(sl()));
  sl.registerFactory<MapLocationBloc>(()=>MapLocationBloc(sl()));
  sl.registerFactory<MapHubsBloc>(()=>MapHubsBloc(sl()));


  //Reservation
  sl.registerSingleton<ReservationApiService>(ReservationApiServiceImp(sl()));
  sl.registerSingleton<ReservationRepository>(ReservationRepositoryImp(sl()));
  sl.registerSingleton<GetBicycleCategoryUsecase>(GetBicycleCategoryUsecase(sl()));
  sl.registerSingleton<GetBicycleByCategoryUsecase>(GetBicycleByCategoryUsecase(sl()));
  sl.registerSingleton<GetHubContentUsecase>(GetHubContentUsecase(sl()));
  sl.registerSingleton<GetPhotoUsecase>(GetPhotoUsecase(sl()));
  sl.registerSingleton<GetBicycleDetailsUsecase>(GetBicycleDetailsUsecase(sl()));
  sl.registerFactory<ReservationBloc>(()=>ReservationBloc(sl(),sl(),sl(),sl()));
  sl.registerFactory<ReservationPhotosBloc>(()=>ReservationPhotosBloc(sl()));

}