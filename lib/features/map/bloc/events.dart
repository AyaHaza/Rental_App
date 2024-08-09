import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

abstract class MapEvents{}


class GetHubs extends MapEvents{
  LocationData currentLocation;
  BuildContext context;
  GetHubs(this.currentLocation,this.context);
}

class GetLocation extends MapEvents{
  BuildContext context;
  GetLocation(this.context);
}

