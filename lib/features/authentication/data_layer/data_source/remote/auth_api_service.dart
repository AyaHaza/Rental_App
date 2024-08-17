
abstract class AuthApiService{
  Future<bool> signup(userEntity);
  Future<bool> signin(userEntity);
}