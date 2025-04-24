
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:rental_clean_tdd/core/error/failure.dart';
import '../../../../core/error/exception.dart';
import '../../domain_layer/entities/policy_entity.dart';
import '../../domain_layer/repository/setting_repository.dart';
import '../data_source/remote/setting_api_service.dart';

class SettingRepositoryImp implements SettingRepository{
  SettingApiService settingApiService;
  SettingRepositoryImp(this.settingApiService);
  @override
  Future<Either<Failure, PolicyEntity>> GetPolicy()async {
    try{
      final res =await settingApiService.GetPolicy();
      return Right(res);
    }on ServerException catch(e){
      return Left(ServerFailure(e.meesage));
    }on SocketException{
      return Left(ConnectionFailure("Failed to connect to the network"));
    }
  }

  @override
  Future<Either<Failure, bool>> changePassword(passwordEntity)async {
    try{
      final res =await settingApiService.changePassword(passwordEntity);
      return Right(res);
    }on ServerException catch(e){
      return Left(ServerFailure(e.meesage));
    }on SocketException{
      return Left(ConnectionFailure("Failed to connect to the network"));
    }
  }

  @override
  Future<Either<Failure, bool>> contactUs(contactUsEntity)async {
    try{
      final res =await settingApiService.contactUs(contactUsEntity);
      return Right(res);
    }on ServerException catch(e){
      return Left(ServerFailure(e.meesage));
    }on SocketException{
      return Left(ConnectionFailure("Failed to connect to the network"));
    }
  }

}