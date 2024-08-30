import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/hubs_entity.dart';
import '../repository/map_repository.dart';

class EditHubsSupaUsecase extends UseCseWithTwoParams<Either<Failure, bool>,int,HubsEntity> {
  MapRepository mapRepository;
  EditHubsSupaUsecase(
      this.mapRepository,
      );

  Future<Either<Failure, bool>> call(id,hubsEntity) async {
    return await mapRepository.editHubsSupa(id,hubsEntity);
  }
}