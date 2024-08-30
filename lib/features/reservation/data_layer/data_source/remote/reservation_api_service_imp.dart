import 'dart:io';
import 'package:dio/dio.dart';
import '../../../../../config/hive_config.dart';
import '../../../../../core/error/exception.dart';
import '../../../../../core/resources/variable.dart';
import '../../../domain_layer/entities/bicycle_by_category_entity.dart';
import '../../../domain_layer/entities/bicycle_category_entity.dart';
import '../../../domain_layer/entities/bicycle_details_entity.dart';
import '../../../domain_layer/entities/hub_content_entity.dart';
import '../../../domain_layer/entities/photo_entity.dart';
import '../../models/bicycle_by_category_model.dart';
import '../../models/bicycle_category_model.dart';
import '../../models/bicycle_details_model.dart';
import '../../models/hub_content_model.dart';
import '../../models/photo_model.dart';
import 'reservation_api_service.dart';

class ReservationApiServiceImp implements ReservationApiService{
  Dio dio;
  ReservationApiServiceImp(this.dio);

  @override
  Future<BicycleCategoryEntity> getBicycleCategory()async {
    try{
      print(baseUrl+getBicycleCategoryApi);
      Response responsee =await dio.get(
          baseUrl+getBicycleCategoryApi,
          options: (userHive==null)?Options(
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
        var getBicycle=BicycleCategoryModel.fromJson(responsee.data);
        print(getBicycle);
        return getBicycle;
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

  @override
  Future<BicycleByCategoryEntity> getBicycleByCategory(category)async {
    try{
      print('$baseUrl$getBicycleByCategoryApi?category=$category');
      Response responsee =await dio.get(
          '$baseUrl$getBicycleByCategoryApi?category=$category',
          options: (userHive==null)?Options(
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
        var getByBicycle=BicycleByCategoryModel.fromJson(responsee.data);
        print(getByBicycle);
        return getByBicycle;
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

  @override
  Future<HubContentEntity> getHubContent(category, hubId) async{
    try{
      print('$baseUrl$getHubContentApi$hubId?bicycleCategory=$category');
      Response responsee =await dio.get(
          '$baseUrl$getHubContentApi$hubId?bicycleCategory=$category',
          options: (userHive==null)?Options(
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
        var getHubContent=HubContentModel.fromJson(responsee.data);
        print(getHubContent);
        return getHubContent;
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
  Future<PhotoEntity> getPhotos()async {
    try{
      print('$baseUrl$getPhoto');
      Response responsee =await dio.get(
          '$baseUrl$getPhoto',
          options: (userHive==null)?Options(
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
        var getImages=PhotoModel.fromJson(responsee.data);
        print(getImages);
        return getImages;
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

  @override
  Future<BicycleDetailsEntity> getdetails(bicycleId)async {
    try{
      print('$baseUrl$getBicycleDetailsApi$bicycleId');
      Response responsee =await dio.get(
          '$baseUrl$getBicycleDetailsApi/$bicycleId',
          options: (userHive==null)?Options(
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
        var getBicycleDetail=BicycleDetailsModel.fromJson(responsee.data);
        print(getBicycleDetail);
        return getBicycleDetail;
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