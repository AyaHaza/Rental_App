

import '../../domain_layer/entities/favorite_entity.dart';

class FavoriteModel extends FavoriteEntity{

  FavoriteModel({
    required super.message,
    required super.status,
    required super.localDateTime,
    required super.body,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
    message: json["message"],
    status: json["status"],
    localDateTime: DateTime.parse(json["localDateTime"]),
    body: List<BodyFav>.from(json["body"].map((x) => BodyFavModel.fromJson(x))),
  );


}

class BodyFavModel extends BodyFav {

  BodyFavModel({
    required super.id,
    required super.bicycle,
    required super.client,
  });

  factory BodyFavModel.fromJson(Map<String, dynamic> json) => BodyFavModel(
    id: json["id"],
    bicycle: BicycleModel.fromJson(json["bicycle"]),
    client: ClientModel.fromJson(json["client"]),
  );
}

class BicycleModel extends Bicycle {

  BicycleModel({
    required super.id,
    required super.modelPrice,
    required super.size,
    required super.photoPath,
    required super.type,
    required super.note,
    required super.maintenance,
  });

  factory BicycleModel.fromJson(Map<String, dynamic> json) => BicycleModel(
    id: json["id"],
    modelPrice: ModelPriceModel.fromJson(json["model_price"]),
    size: json["size"],
    photoPath: json["photoPath"],
    type: json["type"],
    note: json["note"],
    maintenance: List<dynamic>.from(json["maintenance"].map((x) => x)),
  );
}

class ModelPriceModel extends ModelPrice {

  ModelPriceModel({
    required super.id,
    required super.price,
    required super.model,
  });

  factory ModelPriceModel.fromJson(Map<String, dynamic> json) => ModelPriceModel(
    id: json["id"],
    price: json["price"],
    model: json["model"],
  );
}

class ClientModel extends Client {

  ClientModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.phoneNumber,
    required super.username,
    required super.birthDate,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    phoneNumber: json["phoneNumber"],
    username: json["username"],
    birthDate: DateTime.parse(json["birthDate"]),
  );
}
