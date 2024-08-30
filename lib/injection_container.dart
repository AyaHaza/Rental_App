import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'features/authentication/data_layer/data_source/remote/auth_api_service.dart';
import 'features/authentication/data_layer/data_source/remote/auth_api_service_imp.dart';
import 'features/authentication/data_layer/repository/authentication_repository_imp.dart';
import 'features/authentication/domain_layer/repository/authentication_repository.dart';
import 'features/authentication/domain_layer/usecases/add_profile_supa_usecase.dart';
import 'features/authentication/domain_layer/usecases/edit_profile_supa_usecase.dart';
import 'features/authentication/domain_layer/usecases/get_profile_supa_usecase.dart';
import 'features/authentication/domain_layer/usecases/register_with_gamil_usecase.dart';
import 'features/authentication/domain_layer/usecases/signin_usecase.dart';
import 'features/authentication/domain_layer/usecases/signup_usecase.dart';
import 'features/authentication/presentation_layer/bloc/bloc.dart';
import 'features/bicycle_mangement/data_layer/data_source/remote/bicycle_api_service.dart';
import 'features/bicycle_mangement/data_layer/data_source/remote/bicycle_api_service_imp.dart';
import 'features/bicycle_mangement/data_layer/repository/bicycle_repository_imp.dart';
import 'features/bicycle_mangement/domain_layer/repository/bicycle_repository.dart';
import 'features/bicycle_mangement/domain_layer/usecases/add_bicycle_supa_usecase.dart';
import 'features/bicycle_mangement/domain_layer/usecases/delete_bicycle_supa_usecase.dart';
import 'features/bicycle_mangement/domain_layer/usecases/edit_bicycle_Supa_usecase.dart';
import 'features/bicycle_mangement/domain_layer/usecases/get_bicyles_supa_usecase.dart';
import 'features/bicycle_mangement/domain_layer/usecases/get_bicyles_usecase.dart';
import 'features/bicycle_mangement/presentation_layer/bloc/bloc.dart';
import 'features/bicycle_mangement/presentation_layer/bloc/bloc_supa.dart';
import 'features/favorite/data_layer/data_source/remote/favorite_api_service.dart';
import 'features/favorite/data_layer/data_source/remote/favorite_api_service_imp.dart';
import 'features/favorite/data_layer/repository/favorite_repository_imp.dart';
import 'features/favorite/domain_layer/repository/favorite_repository.dart';
import 'features/favorite/domain_layer/usecases/add_to_favorite_usecase.dart';
import 'features/favorite/domain_layer/usecases/get_favorite_usecase.dart';
import 'features/favorite/presentation_layer/bloc/bloc.dart';
import 'features/history/data_layer/data_source/remote/history_api_service.dart';
import 'features/history/data_layer/data_source/remote/history_api_service_imp.dart';
import 'features/history/data_layer/repository/history_repository_imp.dart';
import 'features/history/domain_layer/repository/history_repository.dart';
import 'features/history/domain_layer/usecases/add_to_history_supa_usecase.dart';
import 'features/history/domain_layer/usecases/delete_history_supa_usecase.dart';
import 'features/history/domain_layer/usecases/get_history_supa_usecase.dart';
import 'features/history/presentation_layer/bloc/bloc.dart';
import 'features/map/data_layer/data_source/remote/map_api_service.dart';
import 'features/map/data_layer/data_source/remote/map_api_service_imp.dart';
import 'features/map/data_layer/repository/map_repository_imp.dart';
import 'features/map/domain_layer/repository/map_repository.dart';
import 'features/map/domain_layer/usecases/add_hubs_supa_usecase.dart';
import 'features/map/domain_layer/usecases/delete_hubs_supa_usecase.dart';
import 'features/map/domain_layer/usecases/edit_hubs_supa_usecase.dart';
import 'features/map/domain_layer/usecases/get_hubs_supa_usecase.dart';
import 'features/map/domain_layer/usecases/get_hubs_usecase.dart';
import 'features/map/domain_layer/usecases/get_location_usecase.dart';
import 'features/map/domain_layer/usecases/show_path_usecase.dart';
import 'features/map/presentation_layer/bloc/hubs_bloc.dart';
import 'features/map/presentation_layer/bloc/hubs_supa_bloc.dart';
import 'features/map/presentation_layer/bloc/location_bloc.dart';
import 'features/map/presentation_layer/bloc/path_bloc.dart';
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
import 'features/wallet/data_layer/data_source/remote/wallet_api_service.dart';
import 'features/wallet/data_layer/data_source/remote/wallet_api_service_imp.dart';
import 'features/wallet/data_layer/repository/wallet_repository_imp.dart';
import 'features/wallet/domain_layer/repository/wallet_repository.dart';
import 'features/wallet/domain_layer/usecases/add_money_to_wallet_usecase.dart';
import 'features/wallet/domain_layer/usecases/create_wallet_usecase.dart';
import 'features/wallet/domain_layer/usecases/get_valid_code_usecase.dart';
import 'features/wallet/domain_layer/usecases/get_wallet_info_usecase.dart';
import 'features/wallet/presentaion_layer/bloc/bloc.dart';
import 'features/wallet/presentaion_layer/bloc/bloc_code.dart';

final sl=GetIt.instance;

Future <void> initializeDependencies()async{
  sl.registerSingleton<Dio>(Dio());

  //Authentication
  sl.registerSingleton<AuthApiService>(AuthApiServiceImp(sl()));
  sl.registerSingleton<AuthenticationRepository>(AuthenticationRepositoryImp(sl()));
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase(sl()));
  sl.registerSingleton<SignInUseCase>(SignInUseCase(sl()));
  sl.registerSingleton<RegisterWithGamilUsecase>(RegisterWithGamilUsecase(sl()));
  sl.registerSingleton<GetProfileSupaUsecase>(GetProfileSupaUsecase(sl()));
  sl.registerSingleton<AddProfileSupaUsecase>(AddProfileSupaUsecase(sl()));
  sl.registerSingleton<EditProfileSupaUsecase>(EditProfileSupaUsecase(sl()));
  sl.registerFactory<AuthBloc>(()=>AuthBloc(sl(), sl(),sl(), sl(),sl(),sl()));


  //map
  sl.registerSingleton<MapApiService>(MapApiServiceImp(sl()));
  sl.registerSingleton<MapRepository>(MapRepositoryImp(sl()));
  sl.registerSingleton<GetLocationUsecase>(GetLocationUsecase(sl()));
  sl.registerSingleton<GetHubsUsecase>(GetHubsUsecase(sl()));
  sl.registerSingleton<AddHubsSupaUsecase>(AddHubsSupaUsecase(sl()));
  sl.registerSingleton<DeleteHubsSupaUsecase>(DeleteHubsSupaUsecase(sl()));
  sl.registerSingleton<EditHubsSupaUsecase>(EditHubsSupaUsecase(sl()));
  sl.registerSingleton<GetHubsSupaUsecase>(GetHubsSupaUsecase(sl()));
  sl.registerSingleton<ShowPathUsecase>(ShowPathUsecase(sl()));
  sl.registerFactory<MapLocationBloc>(()=>MapLocationBloc(sl()));
  sl.registerFactory<MapHubsBloc>(()=>MapHubsBloc(sl()));
  sl.registerFactory<MapHubsSupaBloc>(()=>MapHubsSupaBloc(sl(),sl(),sl(),sl()));
  sl.registerFactory<ShowPathBloc>(()=>ShowPathBloc(sl()));



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


  //bicycle management
  sl.registerSingleton<BicycleApiService>(BicycleApiServiceImp(sl()));
  sl.registerSingleton<BicycleRepository>(BicycleRepositoryImp(sl()));
  sl.registerSingleton<AddBicycleSupaUsecase>(AddBicycleSupaUsecase(sl()));
  sl.registerSingleton<DeleteBicycleSupaUsecase>(DeleteBicycleSupaUsecase(sl()));
  sl.registerSingleton<EditBicycleSupaUsecase>(EditBicycleSupaUsecase(sl()));
  sl.registerSingleton<GetBicylesSupaUsecase>(GetBicylesSupaUsecase(sl()));
  sl.registerSingleton<GetBicylesUsecase>(GetBicylesUsecase(sl()));
  sl.registerFactory<BicycleBloc>(()=>BicycleBloc(sl()));
  sl.registerFactory<BicycleSupaBloc>(()=>BicycleSupaBloc(sl(),sl(),sl(),sl()));


  //wallet
  sl.registerSingleton<WalletApiService>(WalletApiServiceImp(sl()));
  sl.registerSingleton<WalletRepository>(WalletRepositoryImp(sl()));
  sl.registerSingleton<CreateWalletUsecase>(CreateWalletUsecase(sl()));
  sl.registerSingleton<GetWalletInfoUsecase>(GetWalletInfoUsecase(sl()));
  sl.registerSingleton<GetValidCodeUsecase>(GetValidCodeUsecase(sl()));
  sl.registerSingleton<AddMoneyToWalletUsecase>(AddMoneyToWalletUsecase(sl()));
  sl.registerFactory<WalletBloc>(()=>WalletBloc(sl(),sl(),sl()));
  sl.registerFactory<BlocCode>(()=>BlocCode(sl()));


  //favorite
  sl.registerSingleton<FavoriteApiService>(FavoriteApiServiceImp(sl()));
  sl.registerSingleton<FavoriteRepository>(FavoriteRepositoryImp(sl()));
  sl.registerSingleton<GetFavoriteUsecase>(GetFavoriteUsecase(sl()));
  sl.registerSingleton<AddToFavoriteUsecase>(AddToFavoriteUsecase(sl()));
  sl.registerFactory<FavouriteBloc>(()=>FavouriteBloc(sl(),sl()));

  //history
  sl.registerSingleton<HistoryApiService>(HistoryApiServiceImp(sl()));
  sl.registerSingleton<HistoryRepository>(HistoryRepositoryImp(sl()));
  sl.registerSingleton<AddToHistorySupaUsecase>(AddToHistorySupaUsecase(sl()));
  sl.registerSingleton<DeleteHistorySupaUsecase>(DeleteHistorySupaUsecase(sl()));
  sl.registerSingleton<GetHistorySupaUsecase>(GetHistorySupaUsecase(sl()));
  sl.registerFactory<HistoryBloc>(()=>HistoryBloc(sl(),sl(),sl()));

}