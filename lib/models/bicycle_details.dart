
class BicycleDetailsModel {
  String message;
  String status;
  DateTime localDateTime;
  Body body;

  BicycleDetailsModel({
    required this.message,
    required this.status,
    required this.localDateTime,
    required this.body,
  });

  factory BicycleDetailsModel.fromJson(Map<String, dynamic> json) => BicycleDetailsModel(
    message: json["message"],
    status: json["status"],
    localDateTime: DateTime.parse(json["localDateTime"]),
    body: Body.fromJson(json["body"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "localDateTime": localDateTime.toIso8601String(),
    "body": body.toJson(),
  };
}

class Body {
  int id;
  ModelPrice modelPrice;
  int size;
  String photoPath;
  String type;
  String note;
  List<dynamic> maintenance;

  Body({
    required this.id,
    required this.modelPrice,
    required this.size,
    required this.photoPath,
    required this.type,
    required this.note,
    required this.maintenance,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
    id: json["id"],
    modelPrice: ModelPrice.fromJson(json["model_price"]),
    size: json["size"],
    photoPath: json["photoPath"],
    type: json["type"],
    note: json["note"],
    maintenance: List<dynamic>.from(json["maintenance"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "model_price": modelPrice.toJson(),
    "size": size,
    "photoPath": photoPath,
    "type": type,
    "note": note,
    "maintenance": List<dynamic>.from(maintenance.map((x) => x)),
  };
}

class ModelPrice {
  int id;
  double price;
  String model;

  ModelPrice({
    required this.id,
    required this.price,
    required this.model,
  });

  factory ModelPrice.fromJson(Map<String, dynamic> json) => ModelPrice(
    id: json["id"],
    price: json["price"]as double,
    model: json["model"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "model": model,
  };
}
