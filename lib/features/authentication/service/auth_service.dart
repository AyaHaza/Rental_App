import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rental_app/models/user_model.dart';
import '../../../config/hive_config.dart';
import '../../../core/error/failure.dart';
import '../../../core/resources/variable.dart';
import '../../../core/service/core_service.dart';
 String username='';
class AuthServiceImp extends CoreService{

  Future<Either<Failure, bool>> register(usermodel)async{
    try{
      print(baseUrl+registerApi);
      isGoogle=false;
      username=usermodel.username;
      CoreService.responsee =await CoreService.dio.post(
          baseUrl+registerApi,
          data: usermodel.toJson()
      );
      print(CoreService.responsee.statusCode);

      print(apiTableProfile);
      var response=await CoreService.dio.post(
          '${apiTableProfile}',
          data: usermodel.toJson(),
          options: Options(
              headers: {
                'apikey':apikeySupa
              }
          )
      );
      print(response.statusCode);
      return const Right(true);
     }on DioException catch (e) {
      print(e.response!.data["message"]);
      var msg = e.response!.data["message"];
      if (msg is List) {
        String temp = '';
        for (String s in msg) temp += s + '\n';
        return Left(ServerFailure(temp));
      } else if(msg is String){
        return Left(ServerFailure(msg));
      }
      else{
        return const Left(ConnectionFailure("An error in network"));
      }
    }

  }


  Future<Either<Failure, bool>> login(usermodel)async{
    try{
      print(baseUrl+loginApi);
      isGoogle=false;
      CoreService.responsee =await CoreService.dio.post(
          baseUrl+loginApi,
          data: usermodel.toJson()
      );
      print(CoreService.responsee.statusCode);
      if(saveToken==true){
        userHive!.put("token", CoreService.responsee.data['body']['token']);
        userHive!.put("username",username);

      }
      return const Right(true);
     }on DioException catch (e) {
      print(e.response!.data["message"]);
      var msg = e.response!.data["message"];
      if (msg is List) {
        String temp = '';
        for (String s in msg) temp += s + '\n';
        return Left(ServerFailure(temp));
      } else if(msg is String){
        return Left(ServerFailure(msg));
      }
      else{
        return const Left(ConnectionFailure("An error in network"));
      }
    }
  }

  Future<Either<Failure, UserModel>> getprofileSupa(username) async{
    try{
      print(apiTableProfile);
      CoreService.responsee=await CoreService.dio.get(
          '${apiTableProfile}?username=eq.$username',
          options: Options(
              headers: {
                'apikey':apikeySupa
              }
          )
      );
      print(CoreService.responsee.statusCode);
      print(CoreService.responsee.data);
      UserModel userProfile=UserModel.fromJson(CoreService.responsee.data[0]);

      print(userProfile);

      return Right(userProfile);
    }catch(e){
      print(e);
      return Left(ConnectionFailure("An error in network"));
    }
  }

  Future<Either<Failure, bool>> editprofileSupa(userModel) async{
    try{
      print(apiTableProfile);
      CoreService.responsee=await CoreService.dio.patch(
          '${apiTableProfile}?username=eq.${userHive!.get('username')}',
          data: userModel.toJson(),
          options: Options(
              headers: {
                'apikey':apikeySupa
              }
          )
      );
      print(CoreService.responsee.statusCode);
      print(CoreService.responsee.data);

      return Right(true);
    }catch(e){
      print(e);
      return Left(ConnectionFailure("An error in network"));
    }
  }

  Future <bool> registerWithGamil()async{
    try{
      await googleSignIn.signIn();
      isGoogle=true;
      // userHive!.put("token", googleSignIn.currentUser!.email);
      user=googleSignIn;
      print(googleSignIn.clientId);
      print(googleSignIn.currentUser?.authHeaders);
      return true;
    }catch(e){
      print(e);
      return false;
    }
  }

  // Future <bool> registerWithFacebook()async{
  //   try{
  //     final loginResult=await FacebookAuth.instance.login(permissions: ['email']);
  //     final userData=await FacebookAuth.instance.getUserData();
  //     print(userData);
  //     final OAuthCredential oAuthCredential= FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
  //     await FirebaseAuth.instance.signInWithCredential(oAuthCredential);
  //     userHive!.put("token",oAuthCredential);
  //     return true;
  //   }catch(e){
  //     print(e);
  //     return false;
  //   }
  // }
}