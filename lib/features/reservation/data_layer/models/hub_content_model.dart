import 'package:rental_clean_tdd/features/reservation/domain_layer/entities/hub_content_entity.dart';

class HubContentModel extends HubContentEntity{

  HubContentModel({
     super.message,
     super.status,
     super.localDateTime,
     super.body,
  });

  factory HubContentModel.fromJson(Map<String, dynamic> json) => HubContentModel(
    message: json["message"],
    status: json["status"],
    localDateTime: DateTime.parse(json["localDateTime"]),
    body: BodyHubModel.fromJson(json["body"]),
  );
}

class BodyHubModel extends BodyEntity {

  BodyHubModel({
     super.id,
     super.hubId,
     super.bicycleList,
     super.note,
  });

  factory BodyHubModel.fromJson(Map<String, dynamic> json) => BodyHubModel(
    id: json["id"],
    hubId: json["hubId"],
    bicycleList: List<BicycleListModel>.from(json["bicycleList"].map((x) => BicycleListModel.fromJson(x))),
    note: json["note"],
  );
}

class BicycleListModel extends BicycleListEntity {

  BicycleListModel({
    super.id,
    super.modelPrice,
    super.type,
    super.size,
    super.note,
    super.maintenance,
    super.extension,
    super.photoId,
    super.hasOffer,
    super.discountPrice,
  });

  factory BicycleListModel.fromJson(Map<String, dynamic> json) => BicycleListModel(
    id: json["id"],
    modelPrice: ModelPriceModel.fromJson(json["model_price"]),
    type: json["type"],
    size: json["size"],
    note: json["note"],
    maintenance: List<dynamic>.from(json["maintenance"].map((x) => x)),
    extension: List<dynamic>.from(json["extension"].map((x) => x)),
    photoId: json["photo_id"],
    hasOffer: json["hasOffer"],
    discountPrice: json["discountPrice"],
  );
}

class ModelPriceModel extends ModelPriceEntity {

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
