abstract class ReservationEvents{}

class getBicycleCategory extends ReservationEvents{}

class getBicycleByCategory extends ReservationEvents{
  String category;
  getBicycleByCategory(this.category);
}

class getHubContent extends ReservationEvents{
  String category;
  int hudId;
  getHubContent(this.category,this.hudId);
}

class getPhotos extends ReservationEvents{}


class getBicycleDetail extends ReservationEvents{
  int bicyleId;
  getBicycleDetail(this.bicyleId);
}