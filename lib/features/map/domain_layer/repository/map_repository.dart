import 'package:dartz/dartz.dart';
import 'package:location/location.dart';
import '../../../../core/error/failure.dart';
import '../entities/hubs_entity.dart';

abstract class MapRepository{
  Future<Either<Failure, LocationData>> getCurrentLocation();
  Future<Either<Failure, List<HubsEntity>>> getHubs(currentLocation);
}