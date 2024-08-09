
class Body {
  int id;
  String name;
  double latitude;
  double longitude;
  String description;

  Body({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.description,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
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
