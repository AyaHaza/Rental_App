import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:rental_clean_tdd/features/authentication/domain_layer/entities/user_regiser_entity.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain_layer/repository/authentication_repository.dart';
import '../data_source/remote/auth_api_service.dart';

class AuthenticationRepositoryImp implements AuthenticationRepository{
  AuthApiService authApiService;
  AuthenticationRepositoryImp(this.authApiService);


  @override
  Future<Either<Failure, bool>> signUp(userEntity)async {
    try{
      final res =await authApiService.signup(userEntity);
      return Right(res);
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
      return Right(res);
    }on ServerException catch(e){
      return Left(ServerFailure(e.meesage));
    }on SocketException{
      return Left(ConnectionFailure("Failed to connect to the network"));
    }
  }

  @override
  Future<Either<Failure, bool>> registerWithGamil()async {
    try{
      final res =await authApiService.registerWithGamil();
      print(".........................................mmmmmmmmmmmmmmmm");
      print(res);
      return Right(res);
    } catch(e){
      return Left(ConnectionFailure("Failed to connect to the network"));
    }
  }

  @override
  Future<Either<Failure, bool>> addprofileSupa(userEntity)async {
    try{
      final res =await authApiService.addprofileSupa(userEntity);
      return Right(res);
    }on ServerException catch(e){
      return Left(ServerFailure(e.meesage));
    }on SocketException{
      return Left(ConnectionFailure("Failed to connect to the network"));
    }
  }

  @override
  Future<Either<Failure, UserRegisterEntity>> getprofileSupa(username)async {
    try{
      final res =await authApiService.getprofileSupa(username);
      return Right(res);
    }on ServerException catch(e){
      return Left(ServerFailure(e.meesage));
    }on SocketException{
      return Left(ConnectionFailure("Failed to connect to the network"));
    }
  }

  @override
  Future<Either<Failure, bool>> editprofileSupa(userEntity)async {
    try{
      final res =await authApiService.editprofileSupa(userEntity);
      return Right(res);
    }on ServerException catch(e){
      return Left(ServerFailure(e.meesage));
    }on SocketException{
      return Left(ConnectionFailure("Failed to connect to the network"));
    }
  }


}