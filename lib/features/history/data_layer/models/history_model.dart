
import '../../domain_layer/entities/history_entity.dart';

class HistoryModel extends HistoryEntity{

  HistoryModel({
     super.id,
     super.statrPoint,
     super.destinationPoint,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
      id: json["id"],
      statrPoint: json["statrPoint"],
      destinationPoint: json["destinationPoint"]
  );

  factory HistoryModel.fromEntity(HistoryEntity json) => HistoryModel(
      id: json.id,
      statrPoint: json.statrPoint,
      destinationPoint: json.destinationPoint
  );

  Map<String, dynamic> toJson() => {
    "statrPoint": statrPoint,
    "destinationPoint": destinationPoint
  };
}
