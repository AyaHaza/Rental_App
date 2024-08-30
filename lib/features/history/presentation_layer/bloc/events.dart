import '../../domain_layer/entities/history_entity.dart';

abstract class HistoryEvent{}


class AddToHistoryEvent extends HistoryEvent{
  HistoryEntity historyEntity;
  AddToHistoryEvent(this.historyEntity);
}

class GetHistoryEvent extends HistoryEvent{}

class DeleteHistoryEvent extends HistoryEvent{
  int id;
  DeleteHistoryEvent(this.id);
}