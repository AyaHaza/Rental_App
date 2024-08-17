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
      final _data = jsonEncode(UserRegisterModel.fromJson(userEntity));
      print(_data);
      print(userEntity);
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
  
}