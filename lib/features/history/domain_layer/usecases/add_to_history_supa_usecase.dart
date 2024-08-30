import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/history_entity.dart';
import '../repository/history_repository.dart';

class AddToHistorySupaUsecase extends UseCse<Either<Failure, bool>,HistoryEntity> {
  HistoryRepository historyRepository;
  AddToHistorySupaUsecase(
      this.historyRepository,
      );

  Future<Either<Failure, bool>> call(hubsEntity) async {
    return await historyRepository.addToHistorySupa(hubsEntity);
  }
}