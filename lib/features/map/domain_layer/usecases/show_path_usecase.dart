import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../repository/map_repository.dart';

class ShowPathUsecase extends UseCseWithTwoParams<Either<Failure, List<LatLng>>,dynamic,dynamic> {
  MapRepository mapRepository;
  ShowPathUsecase(
      this.mapRepository,
      );

  Future<Either<Failure, List<LatLng>>> call(start, destination) async {
    return await mapRepository.showPath(start, destination);
  }
}