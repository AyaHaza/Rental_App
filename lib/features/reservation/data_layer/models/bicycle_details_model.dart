import 'package:rental_clean_tdd/features/reservation/domain_layer/entities/bicycle_details_entity.dart';

class BicycleDetailsModel extends BicycleDetailsEntity{

  BicycleDetailsModel({
    super.message,
    super.status,
    super.localDateTime,
    super.body,
  });

  factory BicycleDetailsModel.fromJson(Map<String, dynamic> json) => BicycleDetailsModel(
    message: json["message"],
    status: json["status"],
    localDateTime: DateTime.parse(json["localDateTime"]),
    body: BodyDetailsModel.fromJson(json["body"]),
  );
}

class BodyDetailsModel extends BodyEntity{

  BodyDetailsModel({
    super.id,
    super.modelPrice,
    super.size,
    super.photoPath,
    super.type,
    super.note,
    super.maintenance,
  });

  factory BodyDetailsModel.fromJson(Map<String, dynamic> json) => BodyDetailsModel(
    id: json["id"],
    modelPrice: ModelPriceDetailsModel.fromJson(json["model_price"]),
    size: json["size"],
    photoPath: json["photoPath"],
    type: json["type"],
    note: json["note"],
    maintenance: List<dynamic>.from(json["maintenance"].map((x) => x)),
  );
}

class ModelPriceDetailsModel extends ModelPriceEntity {

  ModelPriceDetailsModel({
     super.id,
     super.price,
     super.model,
  });

  factory ModelPriceDetailsModel.fromJson(Map<String, dynamic> json) => ModelPriceDetailsModel(
    id: json["id"],
    price: json["price"]as double,
    model: json["model"],
  );
}
