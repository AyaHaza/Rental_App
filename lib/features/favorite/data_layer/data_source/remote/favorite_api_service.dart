import '../../../domain_layer/entities/favorite_entity.dart';

abstract class FavoriteApiService{
  Future<List<BodyFav>> getFavourite();
  Future<bool> addToFavourite(bicycleId);
}