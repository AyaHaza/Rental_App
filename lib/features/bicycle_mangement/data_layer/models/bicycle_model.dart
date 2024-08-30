

import '../../domain_layer/entities/bicycle_entity.dart';

class BicycleModel extends BicycleEntity{

  BicycleModel({
     super.id,
     super.modelPrice,
     super.size,
     super.photoPath,
     super.type,
     super.note,
     super.maintenance,
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

  factory BicycleModel.fromEntity(BicycleEntity json) => BicycleModel(
    id: json.id,
    modelPrice: ModelPrice.fromEntity(json.modelPrice!),
    size: json.size,
    photoPath: json.photoPath,
    type: json.type,
    note: json.note,
    maintenance: List<dynamic>.from(json.maintenance!.map((x) => x)),
  );
}

class ModelPrice extends ModelPriceEntity {

  ModelPrice({
     super.id,
     super.price,
     super.model,
  });

  factory ModelPrice.fromJson(Map<String, dynamic> json) => ModelPrice(
    id: json["id"],
    price: json["price"],
    model: json["model"],
  );

  factory ModelPrice.fromEntity(ModelPriceEntity json) => ModelPrice(
    id: json.id,
    price: json.price,
    model: json.model,
  );
}
