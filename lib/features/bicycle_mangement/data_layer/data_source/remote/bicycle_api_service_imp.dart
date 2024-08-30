import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import '../../../../../config/hive_config.dart';
import '../../../../../core/error/exception.dart';
import '../../../../../core/resources/variable.dart';
import '../../../domain_layer/entities/bicycle_Supa_entity.dart';
import '../../../domain_layer/entities/bicycle_entity.dart';
import '../../models/bicycle_model.dart';
import '../../models/bicycle_supa_model.dart';
import 'bicycle_api_service.dart';

class BicycleApiServiceImp implements BicycleApiService{
  Dio dio;
  BicycleApiServiceImp(this.dio);

  @override
  Future<bool> addBicycleSupa(bicycleEntity)async {
    try{
      print(apiTableBicycle);
      final _data = jsonEncode(BicycleSupaModel.fromEntity(bicycleEntity));
      Response response=await dio.post(
          '${apiTableBicycle}',
          data: _data,
          options: Options(
              headers: {
                'apikey':apikeySupa
              }
          )
      );
      print(response.statusCode);
      return true;
    }catch(e){
      print(e);
      throw SocketException("Failed to connect to the network");
    }
  }

  @override
  Future<bool> deleteBicycleSupa(id) async{
    try{
      print('$apiTableBicycle?id=eq.$id');
      Response responsee=await dio.delete(
          '${apiTableBicycle}?id=eq.$id',
          options: Options(
              headers: {
                'apikey':apikeySupa
              }
          )
      );
      print(responsee.statusCode);
      return true;
    } catch(e){
      print(e);
      throw SocketException("Failed to connect to the network");
    }
  }

  @override
  Future<bool> editBicycleSupa(id, bicycleEntity)async {
    try{
      final _data = jsonEncode(BicycleSupaModel.fromEntity(bicycleEntity));
      print('${apiTableBicycle}?id=eq.$id');
      print(_data);
      Response responsee=await dio.patch(
          '${apiTableBicycle}?id=eq.$id',
          data: _data,
          options: Options(
              headers: {
                'apikey':apikeySupa
              }
          )
      );
      print(responsee.statusCode);
      return true;
    }catch(e){
      print(e);
      throw SocketException("Failed to connect to the network");
    }
  }

  @override
  Future<List<BicycleEntity>> getBicyles() async{
    try{
      Response responsee =await dio.get(
          '$baseUrl$bicycle',
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
        var bicycles=List.generate(responsee.data['body'].length, (index) => BicycleModel.fromJson(responsee.data['body'][index]));
        print(bicycles);
        return bicycles;
      }else{
        throw ServerException(responsee.data.toString());
      }
    }on DioException catch(e){
      print(e);
      throw SocketException("Failed to connect to the network");
    }
  }

  @override
  Future<List<BicycleSupaEntity>> getBicylesSupa()async {
    try{
      Response responsee =await dio.get(
          '$apiTableBicycle?select=*',
          options: Options(
              headers: {
                'apikey':apikeySupa
              }
          )
      );
      print(responsee.statusCode);
      if(responsee.statusCode==200){
        var bicycles=List.generate(responsee.data.length, (index) => BicycleSupaModel.fromJson(responsee.data[index]));
        print(BicycleSupaModel.fromJson(responsee.data.last));
        return bicycles;
      }else{
        throw ServerException(responsee.data.toString());
      }
    } catch(e){
      print(e);
      throw SocketException("Failed to connect to the network");
    }
  }
}