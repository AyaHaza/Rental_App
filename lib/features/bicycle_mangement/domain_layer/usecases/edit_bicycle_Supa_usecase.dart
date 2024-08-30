import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/bicycle_Supa_entity.dart';
import '../repository/bicycle_repository.dart';

class EditBicycleSupaUsecase extends UseCseWithTwoParams<Either<Failure, bool>,int,BicycleSupaEntity> {
  BicycleRepository bicycleRepository;
  EditBicycleSupaUsecase(
      this.bicycleRepository,
      );

  Future<Either<Failure, bool>> call(id,bicycleEntity) async {
    return await bicycleRepository.editBicycleSupa(id,bicycleEntity);
  }
}