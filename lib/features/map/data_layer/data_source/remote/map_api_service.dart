import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import '../../../../history/domain_layer/entities/history_entity.dart';
import '../../../domain_layer/entities/hubs_entity.dart';

abstract class MapApiService{
  Future<LocationData> getCurrentLocation();
  Future<List<HubsEntity>> getHubs(currentLocation);
  Future<bool> addHubsSupa(hubsEntity);
  Future<bool> editHubsSupa(id,hubsEntity);
  Future<bool> deleteHubsSupa(id);
  Future<List<HubsEntity>> getHubsSupa();
  Future<List<LatLng>> showPath(start, destination);
}