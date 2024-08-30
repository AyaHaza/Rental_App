import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain_layer/entities/favorite_entity.dart';
import '../../domain_layer/repository/favorite_repository.dart';
import '../data_source/remote/favorite_api_service.dart';

class FavoriteRepositoryImp implements FavoriteRepository{
  FavoriteApiService favoriteApiService;
  FavoriteRepositoryImp(this.favoriteApiService);

  @override
  Future<Either<Failure, List<BodyFav>>> getFavourite()async{
    try{
      final res =await favoriteApiService.getFavourite();
      return Right(res);
    }on ServerException catch(e){
      return Left(ServerFailure(e.meesage));
    }on SocketException catch(e){
      return Left(ConnectionFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> addToFavourite(bicycleId)async{
    try{
      final res =await favoriteApiService.addToFavourite(bicycleId);
      return Right(res);
    }on ServerException catch(e){
      return Left(ServerFailure(e.meesage));
    }on SocketException catch(e){
      return Left(ConnectionFailure(e.message));
    }
  }
}