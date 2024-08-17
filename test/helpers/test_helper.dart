import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:rental_clean_tdd/features/authentication/data_layer/data_source/remote/auth_api_service.dart';
import 'package:rental_clean_tdd/features/authentication/domain_layer/repository/authentication_repository.dart';
import 'package:rental_clean_tdd/features/map/data_layer/data_source/remote/map_api_service.dart';
import 'package:rental_clean_tdd/features/map/domain_layer/repository/map_repository.dart';
import 'package:rental_clean_tdd/features/map/domain_layer/usecases/get_hubs_usecase.dart';
import 'package:rental_clean_tdd/features/map/domain_layer/usecases/get_location_usecase.dart';
import 'package:rental_clean_tdd/features/authentication/domain_layer/usecases/signin_usecase.dart';
import 'package:rental_clean_tdd/features/authentication/domain_layer/usecases/signup_usecase.dart';
import 'package:rental_clean_tdd/features/reservation/data_layer/data_source/remote/reservation_api_service.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/repository/reservation_repository.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/usecases/get_bicycle_by_category_usecase.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/usecases/get_bicycle_category_usecase.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/usecases/get_bicycle_details_usecase.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/usecases/get_hub_content_usecase.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/usecases/get_photo_usecase.dart';


@GenerateMocks(
  [
    SignUpUseCase,
    SignInUseCase,
    AuthenticationRepository,
    AuthApiService,
    Dio,
    GetLocationUsecase,
    GetHubsUsecase,
    MapRepository,
    MapApiService,
    GetBicycleCategoryUsecase,
    GetBicycleByCategoryUsecase,
    GetBicycleDetailsUsecase,
    GetHubContentUsecase,
    GetPhotoUsecase,
    ReservationRepository,
    ReservationApiService
  ],
)
void main(){

}