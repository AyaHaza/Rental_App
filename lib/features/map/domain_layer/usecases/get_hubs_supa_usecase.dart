import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/hubs_entity.dart';
import '../repository/map_repository.dart';

class GetHubsSupaUsecase extends UseCse<Either<Failure, List<HubsEntity>>,String> {
  MapRepository mapRepository;
  GetHubsSupaUsecase(
      this.mapRepository,
      );

  Future<Either<Failure, List<HubsEntity>>> call(string) async {
    return await mapRepository.getHubsSupa();
  }
}