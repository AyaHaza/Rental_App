import 'dart:convert';

class FavouriteModel{
    final String message;
    final String status;
    final DateTime localDateTime;
    final List<Body> body;

    FavouriteModel({
        required this.message,
        required this.status,
        required this.localDateTime,
        required this.body,
    });

    FavouriteModel copyWith({
        String? message,
        String? status,
        DateTime? localDateTime,
        List<Body>? body,
    }) => 
        FavouriteModel(
            message: message ?? this.message,
            status: status ?? this.status,
            localDateTime: localDateTime ?? this.localDateTime,
            body: body ?? this.body,
        );

    factory FavouriteModel.fromRawJson(String str) => FavouriteModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory FavouriteModel.fromJson(Map<String, dynamic> json) => FavouriteModel(
        message: json["message"],
        status: json["status"],
        localDateTime: DateTime.parse(json["localDateTime"]),
        body: List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "localDateTime": localDateTime.toIso8601String(),
        "body": List<dynamic>.from(body.map((x) => x.toJson())),
    };
}

class Body  {
    final int id;
    final Bicycle bicycle;
    final Client client;

    Body({
        required this.id,
        required this.bicycle,
        required this.client,
    });

    Body copyWith({
        int? id,
        Bicycle? bicycle,
        Client? client,
    }) => 
        Body(
            id: id ?? this.id,
            bicycle: bicycle ?? this.bicycle,
            client: client ?? this.client,
        );

    factory Body.fromRawJson(String str) => Body.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        id: json["id"],
        bicycle: Bicycle.fromJson(json["bicycle"]),
        client: Client.fromJson(json["client"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "bicycle": bicycle.toJson(),
        "client": client.toJson(),
    };
}

class Bicycle {
    final int id;
    final ModelPrice modelPrice;
    final int size;
    final dynamic photoPath;
    final String type;
    final String note;
    final List<dynamic> maintenance;

    Bicycle({
        required this.id,
        required this.modelPrice,
        required this.size,
        required this.photoPath,
        required this.type,
        required this.note,
        required this.maintenance,
    });

    Bicycle copyWith({
        int? id,
        ModelPrice? modelPrice,
        int? size,
        dynamic photoPath,
        String? type,
        String? note,
        List<dynamic>? maintenance,
    }) => 
        Bicycle(
            id: id ?? this.id,
            modelPrice: modelPrice ?? this.modelPrice,
            size: size ?? this.size,
            photoPath: photoPath ?? this.photoPath,
            type: type ?? this.type,
            note: note ?? this.note,
            maintenance: maintenance ?? this.maintenance,
        );

    factory Bicycle.fromRawJson(String str) => Bicycle.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Bicycle.fromJson(Map<String, dynamic> json) => Bicycle(
        id: json["id"],
        modelPrice: ModelPrice.fromJson(json["model_price"]),
        size: json["size"],
        photoPath: json["photoPath"],
        type: json["type"],
        note: json["note"],
        maintenance: List<dynamic>.from(json["maintenance"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "model_price": modelPrice.toJson(),
        "size": size,
        "photoPath": photoPath,
        "type": type,
        "note": note,
        "maintenance": List<dynamic>.from(maintenance.map((x) => x)),
    };
}

class ModelPrice {
    final int id;
    final double price;
    final String model;

    ModelPrice({
        required this.id,
        required this.price,
        required this.model,
    });

    ModelPrice copyWith({
        int? id,
        double? price,
        String? model,
    }) => 
        ModelPrice(
            id: id ?? this.id,
            price: price ?? this.price,
            model: model ?? this.model,
        );

    factory ModelPrice.fromRawJson(String str) => ModelPrice.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

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

class Client {
    final int id;
    final String firstName;
    final String lastName;
    final String phoneNumber;
    final String username;
    final DateTime birthDate;

    Client({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.phoneNumber,
        required this.username,
        required this.birthDate,
    });

    Client copyWith({
        int? id,
        String? firstName,
        String? lastName,
        String? phoneNumber,
        String? username,
        DateTime? birthDate,
    }) => 
        Client(
            id: id ?? this.id,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            phoneNumber: phoneNumber ?? this.phoneNumber,
            username: username ?? this.username,
            birthDate: birthDate ?? this.birthDate,
        );

    factory Client.fromRawJson(String str) => Client.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        username: json["username"],
        birthDate: DateTime.parse(json["birthDate"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "username": username,
        "birthDate": "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
    };
}
