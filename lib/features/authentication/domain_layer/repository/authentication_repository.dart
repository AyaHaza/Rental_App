import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';

abstract class AuthenticationRepository{
  Future<Either<Failure, bool>> signUp(userEntity);
  Future<Either<Failure, bool>> signIn(userEntity);
}