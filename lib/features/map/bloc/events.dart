import 'package:location/location.dart';

abstract class MapEvents{}


class GetHubs extends MapEvents{
  LocationData currentLocation;
  GetHubs(this.currentLocation);
}

class GetLocation extends MapEvents{
}

