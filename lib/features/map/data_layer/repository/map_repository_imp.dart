import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:location/location.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain_layer/entities/hubs_entity.dart';
import '../../domain_layer/repository/map_repository.dart';
import '../data_source/remote/map_api_service.dart';

class MapRepositoryImp implements MapRepository{
  MapApiService mapApiService;
  MapRepositoryImp(this.mapApiService);
  @override
  Future<Either<Failure, LocationData>> getCurrentLocation() async{
    try{
      final res =await mapApiService.getCurrentLocation();
      return Right(res);
    }on DioException catch(e){
      return Left(ServerFailure("An error has occurred"));
    }
  }

  @override
  Future<Either<Failure, List<HubsEntity>>> getHubs(currentLocation) async{
    try{
      final res =await mapApiService.getHubs(currentLocation);
      return Right(res);
    }on ServerException catch(e){
      return Left(ServerFailure(e.meesage));
    }on SocketException catch(e){
      return Left(ConnectionFailure(e.message));
    }
  }
}