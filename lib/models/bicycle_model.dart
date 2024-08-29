
class BicycleModel {
  int id;
  ModelPrice modelPrice;
  int size;
  String photoPath;
  String type;
  String note;
  List<dynamic> maintenance;

  BicycleModel({
    required this.id,
    required this.modelPrice,
    required this.size,
    required this.photoPath,
    required this.type,
    required this.note,
    required this.maintenance,
  });

  factory BicycleModel.fromJson(Map<String, dynamic> json) => BicycleModel(
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
    price: json["price"],
    model: json["model"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "model": model,
  };
}
