abstract class TransportEvents{}

class getBicycleCategory extends TransportEvents{}

class getBicycleByCategory extends TransportEvents{
  String category;
  getBicycleByCategory(this.category);
}

class getHubContent extends TransportEvents{
  String category;
  int hudId;
  getHubContent(this.category,this.hudId);
}

class getBicycleDetail extends TransportEvents{
  int bicyleId;
  getBicycleDetail(this.bicyleId);
}