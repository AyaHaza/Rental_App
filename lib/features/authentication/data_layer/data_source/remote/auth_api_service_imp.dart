import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rental_clean_tdd/core/error/exception.dart';
import 'package:rental_clean_tdd/core/error/failure.dart';
import 'package:rental_clean_tdd/features/authentication/data_layer/data_source/remote/auth_api_service.dart';
import 'package:rental_clean_tdd/features/authentication/data_layer/models/user_login_model.dart';
import '../../../../../config/hive_config.dart';
import '../../../../../core/resources/variable.dart';
import '../../../../../core/service/core_service.dart';
import '../../models/user_register_model.dart';

class AuthApiServiceImp extends AuthApiService{


  @override
  Future<Either<Failure, bool>> signup(userEntity)async {
    try{
      print(baseUrl+registerApi);
      isGoogle=false;
      final _data = jsonEncode(UserRegisterModel.fromJson(userEntity));
      print(_data);
      CoreService.responsee =await CoreService.dio.post(
          baseUrl+registerApi,
          data: _data
      );
      print(CoreService.responsee.statusCode);
      return const Right(true);
    }on DioException catch (e) {
      print(e.response!.data["message"]);
      var msg = e.response!.data["message"];
      if (msg is List) {
        String temp = '';
        for (String s in msg) temp += s + '\n';
        throw ServerException(temp);
      } else if(msg is String){
        throw ServerException(msg);
      }else{
        throw ServerException('unknown error');
      }
    }
  }


  @override
  Future<Either<Failure, bool>> signin(userEntity) async{
    try{
      print(baseUrl+loginApi);
      isGoogle=false;
      final _data = jsonEncode(UserLoginModel.fromJson(userEntity));
      CoreService.responsee =await CoreService.dio.post(
          baseUrl+loginApi,
          data: _data
      );
      print(CoreService.responsee.statusCode);
      if(saveToken==true){
        userHive!.put("token", CoreService.responsee.data['body']['token']);
      }
      return const Right(true);
    }on DioException catch (e) {
      print(e.response!.data["message"]);
      var msg = e.response!.data["message"];
      if (msg is List) {
        String temp = '';
        for (String s in msg) temp += s + '\n';
        throw ServerException(temp);
      } else if(msg is String){
        throw ServerException(msg);
      }else{
        throw ServerException('unknown error');
      }
    }
  }
  
}