import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../repository/favorite_repository.dart';

class AddToFavoriteUsecase extends UseCse<Either<Failure, bool>,int> {
  FavoriteRepository favoriteRepository;
  AddToFavoriteUsecase(
      this.favoriteRepository,
      );

  Future<Either<Failure, bool>> call(bicycleId) async {
    return await favoriteRepository.addToFavourite(bicycleId);
  }
}