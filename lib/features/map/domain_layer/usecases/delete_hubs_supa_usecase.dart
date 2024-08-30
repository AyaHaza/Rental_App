import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../repository/map_repository.dart';

class DeleteHubsSupaUsecase extends UseCse<Either<Failure, bool>,int> {
  MapRepository mapRepository;
  DeleteHubsSupaUsecase(
      this.mapRepository,
      );

  Future<Either<Failure, bool>> call(id) async {
    return await mapRepository.deleteHubsSupa(id);
  }
}