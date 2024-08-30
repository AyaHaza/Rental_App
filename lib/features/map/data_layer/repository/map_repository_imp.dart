import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../history/domain_layer/entities/history_entity.dart';
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

  @override
  Future<Either<Failure, bool>> addHubsSupa(hubsEntity)async{
    try{
      final res =await mapApiService.addHubsSupa(hubsEntity);
      return Right(res);
    }on ServerException catch(e){
      return Left(ServerFailure(e.meesage));
    }on SocketException catch(e){
      return Left(ConnectionFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteHubsSupa(id)async{
    try{
      final res =await mapApiService.deleteHubsSupa(id);
      return Right(res);
    }on ServerException catch(e){
      return Left(ServerFailure(e.meesage));
    }on SocketException catch(e){
      return Left(ConnectionFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> editHubsSupa(id, hubsEntity)async{
    try{
      final res =await mapApiService.editHubsSupa(id,hubsEntity);
      return Right(res);
    }on ServerException catch(e){
      return Left(ServerFailure(e.meesage));
    }on SocketException catch(e){
      return Left(ConnectionFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<HubsEntity>>> getHubsSupa()async{
    try{
      final res =await mapApiService.getHubsSupa();
      return Right(res);
    }on ServerException catch(e){
      return Left(ServerFailure(e.meesage));
    }on SocketException catch(e){
      return Left(ConnectionFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<LatLng>>> showPath(start, destination)async{
    try{
      final res =await mapApiService.showPath(start, destination);
      return Right(res);
    }on ServerException catch(e){
      return Left(ServerFailure(e.meesage));
    }on SocketException catch(e){
      return Left(ConnectionFailure(e.message));
    }
  }

}