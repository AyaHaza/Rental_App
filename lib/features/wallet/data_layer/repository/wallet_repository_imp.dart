
import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain_layer/entities/wallet_info_entity.dart';
import '../../domain_layer/entities/wallet_valid_code_entity.dart';
import '../../domain_layer/repository/wallet_repository.dart';
import '../data_source/remote/wallet_api_service.dart';

class WalletRepositoryImp implements WalletRepository{
  WalletApiService walletApiService;
  WalletRepositoryImp(this.walletApiService);
  @override
  Future<Either<Failure, bool>> createWallet(walletEntity)async {
    try{
      final res =await walletApiService.createWallet(walletEntity);
      return Right(res);
    }on ServerException catch(e){
      return Left(ServerFailure(e.meesage));
    }on SocketException{
      return Left(ConnectionFailure("Failed to connect to the network"));
    }
  }

  @override
  Future<Either<Failure, WalletValidCodeEntity>> getValidCode()async {
    try{
      final res =await walletApiService.getValidCode();
      return Right(res);
    }on ServerException catch(e){
      return Left(ServerFailure(e.meesage));
    }on SocketException{
      return Left(ConnectionFailure("Failed to connect to the network"));
    }
  }

  @override
  Future<Either<Failure, WalletInfoEntity>> getWalletInfo()async {
    try{
      final res =await walletApiService.getWalletInfo();
      return Right(res);
    }on ServerException catch(e){
      return Left(ServerFailure(e.meesage));
    }on SocketException{
      return Left(ConnectionFailure("Failed to connect to the network"));
    }
  }

  @override
  Future<Either<Failure, bool>> addMoneyToWallet(balanceEntity)async {
    try{
      final res =await walletApiService.addMoneyToWallet(balanceEntity);
      return Right(res);
    }on ServerException catch(e){
      return Left(ServerFailure(e.meesage));
    }on SocketException{
      return Left(ConnectionFailure("Failed to connect to the network"));
    }
  }

}