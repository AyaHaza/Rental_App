
import '../../../domain_layer/entities/history_entity.dart';

abstract class HistoryApiService{
  Future<List<HistoryEntity>> getHistorySupa();
  Future<bool> addToHistorySupa(historyEntity);
  Future<bool> deleteHistorySupa(id);
}