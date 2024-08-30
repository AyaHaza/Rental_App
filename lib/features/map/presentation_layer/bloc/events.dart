import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import '../../../history/domain_layer/entities/history_entity.dart';
import '../../domain_layer/entities/hubs_entity.dart';

abstract class MapEvents{}


class GetHubsEvent extends MapEvents{
  LocationData currentLocation;
  GetHubsEvent(this.currentLocation);
}

class GetHubsSupaEvent extends MapEvents{}

class DeleteHubsSupaEvent extends MapEvents{
  int id;
  DeleteHubsSupaEvent(this.id);
}

class AddHubsSupaEvent extends MapEvents{
  HubsEntity hubsEntity;
  AddHubsSupaEvent(this.hubsEntity);
}

class EditHubsSupaEvent extends MapEvents{
  int id;
  HubsEntity hubsEntity;
  EditHubsSupaEvent(this.id,this.hubsEntity);
}

class GetLocationEvent extends MapEvents{}

class ShowPathEvent extends MapEvents{
  LatLng start;
  LatLng destination;
  ShowPathEvent(this.start,this.destination);
}

class AddToListEvent extends MapEvents{
  List data;
  AddToListEvent(this.data);
}

class GetList extends MapEvents{}