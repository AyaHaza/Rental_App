class HistoryModel {
  int id;
  String statrPoint;
  String destinationPoint;

  HistoryModel({
    required this.id,
    required this.statrPoint,
    required this.destinationPoint,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
    id: json["id"],
    statrPoint: json["statrPoint"],
    destinationPoint: json["destinationPoint"]
  );

  Map<String, dynamic> toJson() => {
    "statrPoint": statrPoint,
    "destinationPoint": destinationPoint
  };
}
