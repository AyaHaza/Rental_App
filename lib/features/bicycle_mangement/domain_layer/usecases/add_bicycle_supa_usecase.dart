import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/bicycle_Supa_entity.dart';
import '../repository/bicycle_repository.dart';

class AddBicycleSupaUsecase extends UseCse<Either<Failure, bool>,BicycleSupaEntity> {
  BicycleRepository bicycleRepository;
  AddBicycleSupaUsecase(
      this.bicycleRepository,
      );

  Future<Either<Failure, bool>> call(bicycleEntity) async {
    return await bicycleRepository.addBicycleSupa(bicycleEntity);
  }
}