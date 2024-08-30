import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../repository/history_repository.dart';

class DeleteHistorySupaUsecase extends UseCse<Either<Failure, bool>,int> {
  HistoryRepository historyRepository;
  DeleteHistorySupaUsecase(
      this.historyRepository,
      );

  Future<Either<Failure, bool>> call(id) async {
    return await historyRepository.deleteHistorySupa(id);
  }
}