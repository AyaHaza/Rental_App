import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/favorite_entity.dart';
import '../repository/favorite_repository.dart';

class GetFavoriteUsecase extends UseCse<Either<Failure, List<BodyFav>>,String> {
  FavoriteRepository favoriteRepository;
  GetFavoriteUsecase(
      this.favoriteRepository,
      );

  Future<Either<Failure, List<BodyFav>>> call(string) async {
    return await favoriteRepository.getFavourite();
  }
}