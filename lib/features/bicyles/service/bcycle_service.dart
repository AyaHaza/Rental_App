import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../config/hive_config.dart';
import '../../../core/error/failure.dart';
import '../../../core/resources/variable.dart';
import '../../../core/service/core_service.dart';
import '../../../models/bicycle_Supa_model.dart';
import '../../../models/bicycle_model.dart';


class BicyleService extends CoreService{

  Future<Either<Failure, bool>> addBicycleSupa(bicycleModel) async{
    try{
      print(apiTableBicycle);
      final _data =await json.encoder.convert(bicycleModel);
      print(_data);
      CoreService.responsee=await CoreService.dio.post(
          '${apiTableBicycle}',
          data: _data,
          options: Options(
              headers: {
                'apikey':apikeySupa
              }
          )
      );
      print(CoreService.responsee.statusCode);
      return Right(true);
    }catch(e){
      print(e);
      return Left(ConnectionFailure("An error in network"));
    }
  }

  Future<Either<Failure, bool>> editBicycleSupa(id,bicycleModel) async{
    try{
      final _data =await json.encoder.convert(bicycleModel);
      print('${apiTableBicycle}?id=eq.$id');
      print(_data);
      CoreService.responsee=await CoreService.dio.patch(
          '${apiTableBicycle}?id=eq.$id',
          data: _data,
          options: Options(
              headers: {
                'apikey':apikeySupa
              }
          )
      );
      print(CoreService.responsee.statusCode);
      return Right(true);
    }catch(e){
      print(e);
      return Left(ConnectionFailure("An error in network"));
    }
  }

  Future<Either<Failure, List<BicycleModel>>> getBicyles()async{
    try{
      CoreService.responsee =await CoreService.dio.get(
          '$baseUrl$bicycle',
          options: Options(
              headers: {
                'accept':'*/*',
                'Authorization': 'Bearer ${userHive!.get("token")}'
              }
          )
      );
      print(CoreService.responsee.statusCode);
      if(CoreService.responsee.statusCode==200){
        List<BicycleModel> bicycles=List.generate(CoreService.responsee.data['body'].length, (index) => BicycleModel.fromJson(CoreService.responsee.data['body'][index]));
        print(bicycles);
        return Right(bicycles);
      }else{
        return Left(ServerFailure(CoreService.responsee.data.toString()));
      }
    }catch(e){
      print(e);
      return Left(ConnectionFailure("An error in network"));
    }
  }


  Future<Either<Failure, List<BicycleSupaModel>>> getBicylesSupa()async{
    try{
      CoreService.responsee =await CoreService.dio.get(
          '$apiTableBicycle?select=*',
          options: Options(
              headers: {
                'apikey':apikeySupa
              }
          )
      );
      print(CoreService.responsee.statusCode);
      if(CoreService.responsee.statusCode==200){
        List<BicycleSupaModel> bicycles=List.generate(CoreService.responsee.data.length, (index) => BicycleSupaModel.fromJson(CoreService.responsee.data[index]));
        print(BicycleSupaModel.fromJson(CoreService.responsee.data.last));
        return Right(bicycles);
      }else{
        return Left(ServerFailure(CoreService.responsee.data.toString()));
      }
    }catch(e){
      print(e);
      return Left(ConnectionFailure("An error in network"));
    }
  }

  Future<Either<Failure, bool>> deleteBicycleSupa(id) async{
    try{
      print('$apiTableBicycle?id=eq.$id');
      CoreService.responsee=await CoreService.dio.delete(
          '${apiTableBicycle}?id=eq.$id',
          options: Options(
              headers: {
                'apikey':apikeySupa
              }
          )
      );
      print(CoreService.responsee.statusCode);
      return Right(true);
    }catch(e){
      print(e);
      return Left(ConnectionFailure("An error in network"));
    }
  }

}