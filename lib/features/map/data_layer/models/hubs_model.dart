import '../../domain_layer/entities/hubs_entity.dart';

class HubsModel extends HubsEntity {
  HubsModel({
     super.id,
     super.name,
     super.latitude,
     super.longitude,
     super.description,
  });

  factory HubsModel.fromJson(Map<String, dynamic> json) => HubsModel(
    id: json["id"],
    name: json["name"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "latitude": latitude,
    "longitude": longitude,
    "description": description,
  };
}
