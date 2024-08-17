import 'package:location/location.dart';
import '../../../domain_layer/entities/hubs_entity.dart';

abstract class MapApiService{
  Future<LocationData> getCurrentLocation();
  Future<List<HubsEntity>> getHubs(currentLocation);
}