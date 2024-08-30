import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/history_entity.dart';

abstract class HistoryRepository{
  Future<Either<Failure, List<HistoryEntity>>> getHistorySupa();
  Future<Either<Failure, bool>> addToHistorySupa(historyModel);
  Future<Either<Failure, bool>> deleteHistorySupa(id);
}