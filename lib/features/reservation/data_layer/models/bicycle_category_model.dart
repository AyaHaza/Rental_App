import '../../domain_layer/entities/bicycle_category_entity.dart';

class BicycleCategoryModel extends BicycleCategoryEntity {
  BicycleCategoryModel({
     super.message,
    super.status,
    super.localDateTime,
    super.body,
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
    "localDateTime": localDateTime?.toIso8601String(),
    "body": List<dynamic>.from(body!.map((x) => x)),
  };
}
