import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:rental_clean_tdd/features/authentication/data_layer/data_source/remote/auth_api_service.dart';
import 'package:rental_clean_tdd/features/authentication/domain_layer/repository/authentication_repository.dart';
import 'package:rental_clean_tdd/features/authentication/domain_layer/usecases/add_profile_supa_usecase.dart';
import 'package:rental_clean_tdd/features/authentication/domain_layer/usecases/edit_profile_supa_usecase.dart';
import 'package:rental_clean_tdd/features/authentication/domain_layer/usecases/get_profile_supa_usecase.dart';
import 'package:rental_clean_tdd/features/authentication/domain_layer/usecases/register_with_gamil_usecase.dart';
import 'package:rental_clean_tdd/features/bicycle_mangement/data_layer/data_source/remote/bicycle_api_service.dart';
import 'package:rental_clean_tdd/features/bicycle_mangement/domain_layer/repository/bicycle_repository.dart';
import 'package:rental_clean_tdd/features/bicycle_mangement/domain_layer/usecases/add_bicycle_supa_usecase.dart';
import 'package:rental_clean_tdd/features/bicycle_mangement/domain_layer/usecases/delete_bicycle_supa_usecase.dart';
import 'package:rental_clean_tdd/features/bicycle_mangement/domain_layer/usecases/edit_bicycle_Supa_usecase.dart';
import 'package:rental_clean_tdd/features/bicycle_mangement/domain_layer/usecases/get_bicyles_supa_usecase.dart';
import 'package:rental_clean_tdd/features/bicycle_mangement/domain_layer/usecases/get_bicyles_usecase.dart';
import 'package:rental_clean_tdd/features/favorite/data_layer/data_source/remote/favorite_api_service.dart';
import 'package:rental_clean_tdd/features/favorite/domain_layer/repository/favorite_repository.dart';
import 'package:rental_clean_tdd/features/favorite/domain_layer/usecases/add_to_favorite_usecase.dart';
import 'package:rental_clean_tdd/features/favorite/domain_layer/usecases/get_favorite_usecase.dart';
import 'package:rental_clean_tdd/features/history/data_layer/data_source/remote/history_api_service.dart';
import 'package:rental_clean_tdd/features/history/domain_layer/repository/history_repository.dart';
import 'package:rental_clean_tdd/features/history/domain_layer/usecases/delete_history_supa_usecase.dart';
import 'package:rental_clean_tdd/features/history/domain_layer/usecases/get_history_supa_usecase.dart';
import 'package:rental_clean_tdd/features/map/data_layer/data_source/remote/map_api_service.dart';
import 'package:rental_clean_tdd/features/map/domain_layer/repository/map_repository.dart';
import 'package:rental_clean_tdd/features/map/domain_layer/usecases/add_hubs_supa_usecase.dart';
import 'package:rental_clean_tdd/features/history/domain_layer/usecases/add_to_history_supa_usecase.dart';
import 'package:rental_clean_tdd/features/map/domain_layer/usecases/delete_hubs_supa_usecase.dart';
import 'package:rental_clean_tdd/features/map/domain_layer/usecases/edit_hubs_supa_usecase.dart';
import 'package:rental_clean_tdd/features/map/domain_layer/usecases/get_hubs_supa_usecase.dart';
import 'package:rental_clean_tdd/features/map/domain_layer/usecases/get_hubs_usecase.dart';
import 'package:rental_clean_tdd/features/map/domain_layer/usecases/get_location_usecase.dart';
import 'package:rental_clean_tdd/features/authentication/domain_layer/usecases/signin_usecase.dart';
import 'package:rental_clean_tdd/features/authentication/domain_layer/usecases/signup_usecase.dart';
import 'package:rental_clean_tdd/features/map/domain_layer/usecases/show_path_usecase.dart';
import 'package:rental_clean_tdd/features/reservation/data_layer/data_source/remote/reservation_api_service.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/repository/reservation_repository.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/usecases/get_bicycle_by_category_usecase.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/usecases/get_bicycle_category_usecase.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/usecases/get_bicycle_details_usecase.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/usecases/get_hub_content_usecase.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/usecases/get_photo_usecase.dart';
import 'package:rental_clean_tdd/features/wallet/data_layer/data_source/remote/wallet_api_service.dart';
import 'package:rental_clean_tdd/features/wallet/domain_layer/repository/wallet_repository.dart';
import 'package:rental_clean_tdd/features/wallet/domain_layer/usecases/add_money_to_wallet_usecase.dart';
import 'package:rental_clean_tdd/features/wallet/domain_layer/usecases/create_wallet_usecase.dart';
import 'package:rental_clean_tdd/features/wallet/domain_layer/usecases/get_valid_code_usecase.dart';
import 'package:rental_clean_tdd/features/wallet/domain_layer/usecases/get_wallet_info_usecase.dart';


@GenerateMocks(
  [
    SignUpUseCase,
    SignInUseCase,
    RegisterWithGamilUsecase ,
    GetProfileSupaUsecase ,
    AddProfileSupaUsecase,
    EditProfileSupaUsecase ,
    AuthenticationRepository,
    AuthApiService,
    Dio,
    GetLocationUsecase,
    GetHubsUsecase,
    AddHubsSupaUsecase,
    AddToHistorySupaUsecase,
    DeleteHistorySupaUsecase,
    DeleteHubsSupaUsecase,
    EditHubsSupaUsecase,
    GetHistorySupaUsecase,
    GetHubsSupaUsecase,
    ShowPathUsecase,
    MapRepository,
    MapApiService,
    GetBicycleCategoryUsecase,
    GetBicycleByCategoryUsecase,
    GetBicycleDetailsUsecase,
    GetHubContentUsecase,
    GetPhotoUsecase,
    ReservationRepository,
    ReservationApiService,
    AddBicycleSupaUsecase,
    DeleteBicycleSupaUsecase,
    EditBicycleSupaUsecase,
    GetBicylesSupaUsecase,
    GetBicylesUsecase,
    BicycleRepository,
    BicycleApiService,
    HistoryApiService,
    HistoryRepository,
    AddToFavoriteUsecase,
    GetFavoriteUsecase,
    FavoriteApiService,
    FavoriteRepository,
    AddMoneyToWalletUsecase,
    CreateWalletUsecase,
    GetValidCodeUsecase,
    GetWalletInfoUsecase,
    WalletApiService,
    WalletRepository
  ],
)
void main(){

}