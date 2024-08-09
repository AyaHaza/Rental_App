import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';

abstract class AuthApiService{
  Future<Either<Failure, bool>> signup(userEntity);
  Future<Either<Failure, bool>> signin(userEntity);
}