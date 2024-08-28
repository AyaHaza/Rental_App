class BodyHubsSupa {
  String name;
  double latitude;
  double longitude;
  String description;

  BodyHubsSupa({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.description,
  });

  factory BodyHubsSupa.fromJson(Map<String, dynamic> json) => BodyHubsSupa(
    name: json["name"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "latitude": latitude,
    "longitude": longitude,
    "description": description,
  };
}
