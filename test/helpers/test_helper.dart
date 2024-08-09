import 'package:mockito/annotations.dart';
import 'package:http/http.dart'as http;
import 'package:rental_clean_tdd/features/authentication/data_layer/data_source/remote/auth_api_service.dart';
import 'package:rental_clean_tdd/features/authentication/domain_layer/repository/authentication_repository.dart';
import '../../lib/features/authentication/domain_layer/usecases/signin_usecase.dart';
import '../../lib/features/authentication/domain_layer/usecases/signup_usecase.dart';

@GenerateMocks(
  [
    SignUpUseCase,
    SignInUseCase,
    AuthenticationRepository,
    AuthApiService

  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)

void main(){
}