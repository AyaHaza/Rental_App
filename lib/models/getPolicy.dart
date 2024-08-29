import 'dart:convert';

class GetPolicyModel {
    final String message;
    final String status;
    final DateTime localDateTime;
    final Body body;

    GetPolicyModel({
        required this.message,
        required this.status,
        required this.localDateTime,
        required this.body,
    });

    GetPolicyModel copyWith({
        String? message,
        String? status,
        DateTime? localDateTime,
        Body? body,
    }) => 
        GetPolicyModel(
            message: message ?? this.message,
            status: status ?? this.status,
            localDateTime: localDateTime ?? this.localDateTime,
            body: body ?? this.body,
        );

    factory GetPolicyModel.fromRawJson(String str) => GetPolicyModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetPolicyModel.fromJson(Map<String, dynamic> json) => GetPolicyModel(
        message: json["message"],
        status: json["status"],
        localDateTime: DateTime.parse(json["localDateTime"]),
        body: Body.fromJson(json["body"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "localDateTime": localDateTime.toIso8601String(),
        "body": body.toJson(),
    };
}

class Body {
    final int id;
    final String title;
    final String description;

    Body({
        required this.id,
        required this.title,
        required this.description,
    });

    Body copyWith({
        int? id,
        String? title,
        String? description,
    }) => 
        Body(
            id: id ?? this.id,
            title: title ?? this.title,
            description: description ?? this.description,
        );

    factory Body.fromRawJson(String str) => Body.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        id: json["id"],
        title: json["title"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
    };
}
