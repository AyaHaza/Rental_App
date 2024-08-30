abstract class FavouriteEvent{}

class GetFavorite extends FavouriteEvent{}

class AddToFavorite extends FavouriteEvent{
  int bicycleId;
  AddToFavorite(this.bicycleId);
}
