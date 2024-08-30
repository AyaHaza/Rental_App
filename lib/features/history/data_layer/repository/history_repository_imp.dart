import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain_layer/entities/history_entity.dart';
import '../../domain_layer/repository/history_repository.dart';
import '../data_source/remote/history_api_service.dart';

class HistoryRepositoryImp implements HistoryRepository{
  HistoryApiService historyApiService;
  HistoryRepositoryImp(this.historyApiService);
  @override
  Future<Either<Failure, List<HistoryEntity>>> getHistorySupa()async{
    try{
      final res =await historyApiService.getHistorySupa();
      return Right(res);
    }on ServerException catch(e){
      return Left(ServerFailure(e.meesage));
    }on SocketException catch(e){
      return Left(ConnectionFailure(e.message));
    }
  }
  @override
  Future<Either<Failure, bool>> addToHistorySupa(historyModel)async{
    try{
      final res =await historyApiService.addToHistorySupa(historyModel);
      return Right(res);
    }on ServerException catch(e){
      return Left(ServerFailure(e.meesage));
    }on SocketException catch(e){
      return Left(ConnectionFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteHistorySupa(id)async{
    try{
      final res =await historyApiService.deleteHistorySupa(id);
      return Right(res);
    }on ServerException catch(e){
      return Left(ServerFailure(e.meesage));
    }on SocketException catch(e){
      return Left(ConnectionFailure(e.message));
    }
  }
}