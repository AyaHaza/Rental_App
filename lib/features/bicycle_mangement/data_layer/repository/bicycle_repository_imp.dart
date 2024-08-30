import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain_layer/entities/bicycle_Supa_entity.dart';
import '../../domain_layer/entities/bicycle_entity.dart';
import '../../domain_layer/repository/bicycle_repository.dart';
import '../data_source/remote/bicycle_api_service.dart';

class BicycleRepositoryImp implements BicycleRepository{
  BicycleApiService bicycleApiService;
  BicycleRepositoryImp(this.bicycleApiService);
  @override
  Future<Either<Failure, bool>> addBicycleSupa(bicycleEntity)async{
    try{
      final res =await bicycleApiService.addBicycleSupa(bicycleEntity);
      return Right(res);
    }on ServerException catch(e){
      return Left(ServerFailure(e.meesage));
    }on SocketException catch(e){
      return Left(ConnectionFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteBicycleSupa(id)async{
    try{
      final res =await bicycleApiService.deleteBicycleSupa(id);
      return Right(res);
    }on ServerException catch(e){
      return Left(ServerFailure(e.meesage));
    }on SocketException catch(e){
      return Left(ConnectionFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> editBicycleSupa(id, bicycleEntity)async{
    try{
      final res =await bicycleApiService.editBicycleSupa(id,bicycleEntity);
      return Right(res);
    }on ServerException catch(e){
      return Left(ServerFailure(e.meesage));
    }on SocketException catch(e){
      return Left(ConnectionFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<BicycleEntity>>> getBicyles()async{
    try{
      final res =await bicycleApiService.getBicyles();
      return Right(res);
    }on ServerException catch(e){
      return Left(ServerFailure(e.meesage));
    }on SocketException catch(e){
      return Left(ConnectionFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<BicycleSupaEntity>>> getBicylesSupa()async{
    try{
      final res =await bicycleApiService.getBicylesSupa();
      return Right(res);
    }on ServerException catch(e){
      return Left(ServerFailure(e.meesage));
    }on SocketException catch(e){
      return Left(ConnectionFailure(e.message));
    }
  }
}