
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/favorite_entity.dart';

abstract class FavoriteRepository{
  Future<Either<Failure,List<BodyFav>>> getFavourite();
  Future<Either<Failure,bool>> addToFavourite(bicycleId);
}