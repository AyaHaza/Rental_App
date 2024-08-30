import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/bicycle_entity.dart';
import '../repository/bicycle_repository.dart';

class GetBicylesUsecase extends UseCse<Either<Failure, List<BicycleEntity>>,String> {
  BicycleRepository bicycleRepository;
  GetBicylesUsecase(
      this.bicycleRepository,
      );

  Future<Either<Failure, List<BicycleEntity>>> call(string) async {
    return await bicycleRepository.getBicyles();
  }
}