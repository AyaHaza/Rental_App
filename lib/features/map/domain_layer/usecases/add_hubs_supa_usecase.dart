import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/hubs_entity.dart';
import '../repository/map_repository.dart';

class AddHubsSupaUsecase extends UseCse<Either<Failure, bool>,HubsEntity> {
  MapRepository mapRepository;
  AddHubsSupaUsecase(
      this.mapRepository,
      );

  Future<Either<Failure, bool>> call(hubsEntity) async {
    return await mapRepository.addHubsSupa(hubsEntity);
  }
}