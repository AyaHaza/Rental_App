import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain_layer/entities/bicycle_by_category_entity.dart';
import '../../domain_layer/entities/bicycle_category_entity.dart';
import '../../domain_layer/entities/bicycle_details_entity.dart';
import '../../domain_layer/entities/hub_content_entity.dart';
import '../../domain_layer/entities/photo_entity.dart';
import '../../domain_layer/repository/reservation_repository.dart';
import '../data_source/remote/reservation_api_service.dart';

class ReservationRepositoryImp implements ReservationRepository{
  ReservationApiService reservationApiService;
  ReservationRepositoryImp(this.reservationApiService);

  @override
  Future<Either<Failure, BicycleCategoryEntity>> getBicycleCategory() async{
    try{
      final res =await reservationApiService.getBicycleCategory();
      return Right(res);
    }on ServerException catch(e){
      return Left(ServerFailure(e.meesage));
    }on SocketException catch(e){
      return Left(ConnectionFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, BicycleByCategoryEntity>> getBicycleByCategory(category) async{
    try{
      final res =await reservationApiService.getBicycleByCategory(category);
      return Right(res);
    }on ServerException catch(e){
      return Left(ServerFailure(e.meesage));
    }on SocketException catch(e){
      return Left(ConnectionFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, HubContentEntity>> getHubContent(category, hubId) async{
    try{
      final res =await reservationApiService.getHubContent(category, hubId);
      return Right(res);
    }on ServerException catch(e){
      return Left(ServerFailure(e.meesage));
    }on SocketException catch(e){
      return Left(ConnectionFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, PhotoEntity>> getPhotos() async{
    try{
      final res =await reservationApiService.getPhotos();
      return Right(res);
    }on ServerException catch(e){
      return Left(ServerFailure(e.meesage));
    }on SocketException catch(e){
      return Left(ConnectionFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, BicycleDetailsEntity>> getdetails(bicycleId) async{
    try{
      final res =await reservationApiService.getdetails(bicycleId);
      return Right(res);
    }on ServerException catch(e){
      return Left(ServerFailure(e.meesage));
    }on SocketException catch(e){
      return Left(ConnectionFailure(e.message));
    }
  }
}