
import '../../domain_layer/entities/bicycle_Supa_entity.dart';

class BicycleSupaModel extends BicycleSupaEntity{

  BicycleSupaModel({
     super.id,
     super.modelName,
     super.price,
     super.size,
     super.note,
     super.type,
     super.photoPath,
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

  factory BicycleSupaModel.fromEntity(BicycleSupaEntity json) => BicycleSupaModel(
    id: json.id,
    modelName: json.modelName,
    price: json.price,
    size: json.size,
    note: json.note,
    type: json.type,
    photoPath: json.photoPath,
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
