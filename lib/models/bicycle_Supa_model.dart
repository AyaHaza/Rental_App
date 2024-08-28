
class BicycleSupaModel {
  int? id;
  String modelName;
  double price;
  int size;
  String note;
  String type;
  String photoPath;

  BicycleSupaModel({
    required this.id,
    required this.modelName,
    required this.price,
    required this.size,
    required this.note,
    required this.type,
    required this.photoPath,
  });

  factory BicycleSupaModel.fromJson(Map<String, dynamic> json) => BicycleSupaModel(
    id: json["id"],
    modelName: json["modelName"],
    price: json["price"],
    size: json["size"],
    note: json["note"],
    type: json["type"],
    photoPath: json["photoPath"],
  );

  Map<String, dynamic> toJson() => {
    "modelName": modelName,
    "price": price,
    "size": size,
    "note": note,
    "type": type,
    "photoPath": photoPath,
  };
}
