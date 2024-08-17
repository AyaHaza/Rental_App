import 'package:dartz/dartz.dart';
import 'package:location/location.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../repository/map_repository.dart';

class GetLocationUsecase extends UseCse<Either<Failure, LocationData>,String> {
  MapRepository mapRepository;
  GetLocationUsecase(
      this.mapRepository,
      );

  Future<Either<Failure, LocationData>> call(params) async {
    return await mapRepository.getCurrentLocation();
  }
}