class BicycleCategoryModel {
  String message;
  String status;
  DateTime localDateTime;
  List<String> body;

  BicycleCategoryModel({
    required this.message,
    required this.status,
    required this.localDateTime,
    required this.body,
  });

  factory BicycleCategoryModel.fromJson(Map<String, dynamic> json) => BicycleCategoryModel(
    message: json["message"],
    status: json["status"],
    localDateTime: DateTime.parse(json["localDateTime"]),
    body: List<String>.from(json["body"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "localDateTime": localDateTime.toIso8601String(),
    "body": List<dynamic>.from(body.map((x) => x)),
  };
}
