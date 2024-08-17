import 'package:location/location.dart';

abstract class MapEvents{}

class GetLocationEvent extends MapEvents{}

class GetHubsEvent extends MapEvents{
  LocationData currentLocation;
  GetHubsEvent(this.currentLocation);
}