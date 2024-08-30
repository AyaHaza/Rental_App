import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import '../../../../core/error/failure.dart';
import '../../../history/domain_layer/entities/history_entity.dart';
import '../entities/hubs_entity.dart';

abstract class MapRepository{
  Future<Either<Failure, LocationData>> getCurrentLocation();
  Future<Either<Failure, List<HubsEntity>>> getHubs(currentLocation);
  Future<Either<Failure, bool>> addHubsSupa(hubsEntity);
  Future<Either<Failure, bool>> editHubsSupa(id,hubsEntity);
  Future<Either<Failure, bool>> deleteHubsSupa(id);
  Future<Either<Failure, List<HubsEntity>>> getHubsSupa();
  Future<Either<Failure,List<LatLng>>> showPath(start, destination);

}