import 'dart:io';

import 'package:rental_clean_tdd/core/error/exception.dart';

import '../../../../core/error/failure.dart';
import '../../domain_layer/repository/authentication_repository.dart';
import 'package:dartz/dartz.dart';
import '../data_source/remote/auth_api_service.dart';

class AuthenticationRepositoryImp extends AuthenticationRepository{
  AuthApiService authApiService;
  AuthenticationRepositoryImp(this.authApiService);


  @override
  Future<Either<Failure, bool>> signUp(userEntity)async {
    try{
      final res =await authApiService.signup(userEntity);
      return Right(true);
    }on ServerException catch(e){
      return Left(ServerFailure(e.meesage));
    }on SocketException{
      return Left(ConnectionFailure("Failed to connect to the network"));
    }
  }

  @override
  Future<Either<Failure, bool>> signIn(userEntity)async {
    try{
      final res =await authApiService.signin(userEntity);
      return Right(true);
    }on ServerException catch(e){
      return Left(ServerFailure(e.meesage));
    }on SocketException{
      return Left(ConnectionFailure("Failed to connect to the network"));
    }
  }


  
}