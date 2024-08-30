
import '../../../domain_layer/entities/user_regiser_entity.dart';

abstract class AuthApiService{
  Future<bool> signup(userEntity);
  Future<bool> signin(userEntity);
  Future <bool> registerWithGamil();
  Future<bool> addprofileSupa(userEntity);
  Future<UserRegisterEntity> getprofileSupa(username);
  Future<bool> editprofileSupa(userEntity);
}