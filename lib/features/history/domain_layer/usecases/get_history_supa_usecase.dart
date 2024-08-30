import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../../../history/domain_layer/entities/history_entity.dart';
import '../repository/history_repository.dart';

class GetHistorySupaUsecase extends UseCse<Either<Failure, List<HistoryEntity>>,String> {
  HistoryRepository historyRepository;
  GetHistorySupaUsecase(
      this.historyRepository,
      );

  Future<Either<Failure, List<HistoryEntity>>> call(string) async {
    return await historyRepository.getHistorySupa();
  }
}