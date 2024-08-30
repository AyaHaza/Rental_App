import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/bicycle_Supa_entity.dart';
import '../repository/bicycle_repository.dart';

class GetBicylesSupaUsecase extends UseCse<Either<Failure, List<BicycleSupaEntity>>,String> {
  BicycleRepository bicycleRepository;
  GetBicylesSupaUsecase(
      this.bicycleRepository,
      );

  Future<Either<Failure, List<BicycleSupaEntity>>> call(string) async {
    return await bicycleRepository.getBicylesSupa();
  }
}