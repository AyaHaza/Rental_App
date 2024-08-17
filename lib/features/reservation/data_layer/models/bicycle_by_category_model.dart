import 'package:rental_clean_tdd/features/reservation/domain_layer/entities/bicycle_by_category_entity.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/entities/bicycle_category_entity.dart';

class BicycleByCategoryModel extends BicycleByCategoryEntity {

  BicycleByCategoryModel({
    super.message,
    super.status,
    super.localDateTime,
    super.body,
  });

  factory BicycleByCategoryModel.fromJson(Map<String, dynamic> json) =>
      BicycleByCategoryModel(
        message: json["message"],
        status: json["status"],
        localDateTime: DateTime.parse(json["localDateTime"]),
        body: List<BodyModel>.from(
            json["body"].map((x) => BodyModel.fromJson(x))),
      );
}

class BodyModel extends BodyEntity {

  BodyModel({
     super.id,
    super.modelPrice,
    super.size,
    super.photoPath,
    super.type,
    super.note,
    super.maintenance,
  });

  factory BodyModel.fromJson(Map<String, dynamic> json) => BodyModel(
    id: json["id"],
    modelPrice: ModelPriceModel.fromJson(json["model_price"]),
    size: json["size"],
    photoPath: json["photoPath"],
    type: json["type"],
    note: json["note"],
    maintenance: List<dynamic>.from(json["maintenance"].map((x) => x)),
  );
}

class ModelPriceModel extends ModelPriceEntity{

  ModelPriceModel({
     super.id,
     super.price,
     super.model,
  });

  factory ModelPriceModel.fromJson(Map<String, dynamic> json) => ModelPriceModel(
    id: json["id"],
    price: json["price"] as double,
    model: json["model"],
  );
}
