import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import '../../../../../config/hive_config.dart';
import '../../../../../core/error/exception.dart';
import '../../../../../core/resources/variable.dart';
import '../../models/user_login_model.dart';
import '../../models/user_register_model.dart';
import 'auth_api_service.dart';

class AuthApiServiceImp implements AuthApiService{
  Dio dio;
  AuthApiServiceImp(this.dio);

  @override
  Future<bool> signup(userEntity)async {
    try{
      print(baseUrl+registerApi);
      isGoogle=false;
      username=userEntity.username;
      final _data = jsonEncode(UserRegisterModel.fromJson(userEntity));
      print(_data);
      Response responsee =await dio.post(
          baseUrl+registerApi,
          data: _data
      );
      print(responsee.statusCode);
      return true;
    }on DioException catch (e) {
      if(e.response == null){
        throw DioException(requestOptions: RequestOptions());
      }
      print(e.response!.data["message"]);
      var msg = e.response!.data["message"];
      if (msg is List) {
        String temp = '';
        for (String s in msg) temp += s + '\n';
        throw ServerException(temp);
      } else if(msg is String){
        throw ServerException(msg);
      }else{
        throw SocketException("Failed to connect to the network");
      }
    }
  }

  @override
  Future<bool> signin(userEntity) async{
    try{
      print(baseUrl+loginApi);
      isGoogle=false;
      final _data = jsonEncode(UserLoginModel.fromJson(userEntity));
      print(_data);
      Response responsee =await dio.post(
          baseUrl+loginApi,
          data: _data
      );
      print(responsee.statusCode);
      if(saveToken==true){
        userHive!.put("token", responsee.data['body']['token']);
        userHive!.put("username",username);
      }
      return true;
    }on DioException catch (e) {
      if(e.response == null){
        throw DioException(requestOptions: RequestOptions());
      }
      print(e.response!.data["message"]);
      var msg = e.response!.data["message"];
      if (msg is List) {
        String temp = '';
        for (String s in msg) temp += s + '\n';
        throw ServerException(temp);
      } else if(msg is String){
        throw ServerException(msg);
      }else{
        throw SocketException("Failed to connect to the network");
      }
    }
  }

  @override
  Future <UserRegisterModel>getprofileSupa(usernamee) async{
    try{
      print('${apiTableProfile}?username=eq.${(userHive==null)?'asqqqqwf3fwq':{userHive!.get("username")}}');
      Response responsee=await dio.get(
          '${apiTableProfile}?username=eq.${(userHive==null)?'asqqqqwf3fwq':{userHive!.get("username")}}',
          options: Options(
              headers: {
                'apikey':apikeySupa
              }
          )
      );
      print(responsee.statusCode);
      print(responsee.data);
      var userProfile=UserRegisterModel.fromJsonMap(responsee.data[0]);

      print(userProfile);
        return userProfile;
    }catch(e){
      print(e);
      throw SocketException("Failed to connect to the network");
    }
  }

  @override
  Future<bool> addprofileSupa(userEntity) async{
    try{
      print(apiTableProfile);
      final _data = jsonEncode(UserRegisterModel.fromJson(userEntity));
      Response response=await dio.post(
          '${apiTableProfile}',
          data: _data,
          options: Options(
              headers: {
                'apikey':apikeySupa
              }
          )
      );
      // print(response.statusCode);

      return true;
    }catch(e){
      print(e);
      throw SocketException("Failed to connect to the network");
    }
  }

  @override
  Future<bool> editprofileSupa(userEntity) async{
    try{
      print(apiTableProfile);
      final _data = jsonEncode(UserRegisterModel.fromJson(userEntity));
      if(userHive==null){
        Response responsee=await dio.patch(
            '${apiTableProfile}?username=eq.asqqqqwf3fwq',
            data: _data,
            options: Options(
                headers: {
                  'apikey':apikeySupa
                }
            )
        );
      }else{
        Response responsee=await dio.patch(
            '${apiTableProfile}?username=eq.${userHive!.get('username')}',
            data: _data,
            options: Options(
                headers: {
                  'apikey':apikeySupa
                }
            )
        );
      }
      return true;
    }catch(e){
      print(e);
      throw SocketException("Failed to connect to the network");
    }
  }

  @override
  Future <bool> registerWithGamil()async{
    try{
      await googleSignIn.signIn();
      isGoogle=true;
      print(googleSignIn.currentUser?.authHeaders);
      return true;
    }catch(e){
      print(e);
      throw SocketException("Failed to connect to the network");
    }
  }

}