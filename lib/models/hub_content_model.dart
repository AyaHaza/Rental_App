class HubContentModel {
  String message;
  String status;
  DateTime localDateTime;
  Body body;

  HubContentModel({
    required this.message,
    required this.status,
    required this.localDateTime,
    required this.body,
  });

  factory HubContentModel.fromJson(Map<String, dynamic> json) => HubContentModel(
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
  int hubId;
  List<BicycleList> bicycleList;
  String note;

  Body({
    required this.id,
    required this.hubId,
    required this.bicycleList,
    required this.note,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
    id: json["id"],
    hubId: json["hubId"],
    bicycleList: List<BicycleList>.from(json["bicycleList"].map((x) => BicycleList.fromJson(x))),
    note: json["note"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "hubId": hubId,
    "bicycleList": List<dynamic>.from(bicycleList.map((x) => x.toJson())),
    "note": note,
  };
}

class BicycleList {
  int id;
  ModelPrice modelPrice;
  String type;
  int size;
  String note;
  List<dynamic> maintenance;
  List<dynamic> extension;
  int photoId;
  dynamic hasOffer;
  dynamic discountPrice;

  BicycleList({
    required this.id,
    required this.modelPrice,
    required this.type,
    required this.size,
    required this.note,
    required this.maintenance,
    required this.extension,
    required this.photoId,
    required this.hasOffer,
    required this.discountPrice,
  });

  factory BicycleList.fromJson(Map<String, dynamic> json) => BicycleList(
    id: json["id"],
    modelPrice: ModelPrice.fromJson(json["model_price"]),
    type: json["type"],
    size: json["size"],
    note: json["note"],
    maintenance: List<dynamic>.from(json["maintenance"].map((x) => x)),
    extension: List<dynamic>.from(json["extension"].map((x) => x)),
    photoId: json["photo_id"],
    hasOffer: json["hasOffer"],
    discountPrice: json["discountPrice"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "model_price": modelPrice.toJson(),
    "type": type,
    "size": size,
    "note": note,
    "maintenance": List<dynamic>.from(maintenance.map((x) => x)),
    "extension": List<dynamic>.from(extension.map((x) => x)),
    "photo_id": photoId,
    "hasOffer": hasOffer,
    "discountPrice": discountPrice,
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
    price: json["price"] as double,
    model: json["model"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "model": model,
  };
}
