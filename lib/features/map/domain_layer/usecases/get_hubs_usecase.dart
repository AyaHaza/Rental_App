import 'package:dartz/dartz.dart';
import 'package:location/location.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/hubs_entity.dart';
import '../repository/map_repository.dart';

class GetHubsUsecase extends UseCse<Either<Failure, List<HubsEntity>>,LocationData> {
  MapRepository mapRepository;
  GetHubsUsecase(
      this.mapRepository,
      );

  Future<Either<Failure, List<HubsEntity>>> call(currentLocation) async {
    return await mapRepository.getHubs(currentLocation);
  }
}