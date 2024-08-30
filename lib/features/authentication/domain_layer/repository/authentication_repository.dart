import 'package:dartz/dartz.dart';
import 'package:rental_clean_tdd/features/authentication/domain_layer/entities/user_regiser_entity.dart';
import '../../../../core/error/failure.dart';

abstract class AuthenticationRepository{
  Future<Either<Failure, bool>> signUp(userEntity);
  Future<Either<Failure, bool>> signIn(userEntity);
  Future<Either<Failure, bool>> registerWithGamil();
  Future<Either<Failure, bool>> addprofileSupa(userEntity);
  Future<Either<Failure, UserRegisterEntity>> getprofileSupa(username);
  Future<Either<Failure, bool>> editprofileSupa(userEntity);
}