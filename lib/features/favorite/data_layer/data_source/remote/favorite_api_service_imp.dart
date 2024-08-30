import 'dart:io';
import 'package:dio/dio.dart';
import '../../../../../config/hive_config.dart';
import '../../../../../core/error/exception.dart';
import '../../../../../core/resources/variable.dart';
import '../../../domain_layer/entities/favorite_entity.dart';
import '../../models/favorite_model.dart';
import 'favorite_api_service.dart';

class FavoriteApiServiceImp implements FavoriteApiService{
  Dio dio;
  FavoriteApiServiceImp(this.dio);
  @override
  Future<List<BodyFav>> getFavourite()async{
    try{
      print(baseUrl+faouriteApi);
      Response responsee =await dio.get(
          baseUrl+faouriteApi,
          options:(userHive==null)?Options(
              headers: {
                'accept':'*/*',
                'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMjIyODg3NzkxIiwiaWF0IjoxNzI0ODczODIxLCJleHAiOjE3MjQ5NjAyMjF9'
              }
          ):Options(
              headers: {
                'accept':'*/*',
                'Authorization':'Bearer ${userHive!.get("token")}'
              }
          )
      );
      print(responsee.statusCode);
      if(responsee.statusCode==200){
        var favoritList=List.generate(responsee.data['body'].length, (index) => BodyFavModel.fromJson(responsee.data['body'][index]));
        return favoritList;
      }else{
        throw ServerException(responsee.data.toString());
      }
    }on DioException catch(e){
      if(e.response !=null){
        throw SocketException(e.response!.data['message'].toString());
      }else{
        throw SocketException("Failed to connect to the network");
      }
    }
  }

  @override
  Future<bool> addToFavourite(bicycleId)async{
    try{
      print(baseUrl+favourite_biclesApi);
      Response responsee =await dio.post(
          baseUrl+favourite_biclesApi,
          data: {
            'bicycleId':bicycleId
          },
          options:(userHive==null)?Options(
              headers: {
                'accept':'*/*',
                'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMjIyODg3NzkxIiwiaWF0IjoxNzI0ODczODIxLCJleHAiOjE3MjQ5NjAyMjF9'
              }
          ):Options(
              headers: {
                'accept':'*/*',
                'Authorization':'Bearer ${userHive!.get("token")}'
              }
          )
      );
      print(responsee.statusCode);
      if(responsee.statusCode==201){
        return true;
      }else{
        throw ServerException(responsee.data.toString());
      }
    }on DioException catch(e){
      if(e.response !=null){
        throw SocketException(e.response!.data.toString());
      }else{
        throw SocketException("Failed to connect to the network");
      }
    }
  }

}