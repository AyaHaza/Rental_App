import 'dart:convert';

class AllvalidcodeModel {
    final String message;
    final String status;
    final DateTime localDateTime;
    final List<Body> body;

    AllvalidcodeModel({
        required this.message,
        required this.status,
        required this.localDateTime,
        required this.body,
    });

    AllvalidcodeModel copyWith({
        String? message,
        String? status,
        DateTime? localDateTime,
        List<Body>? body,
    }) => 
        AllvalidcodeModel(
            message: message ?? this.message,
            status: status ?? this.status,
            localDateTime: localDateTime ?? this.localDateTime,
            body: body ?? this.body,
        );

    factory AllvalidcodeModel.fromRawJson(String str) => AllvalidcodeModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AllvalidcodeModel.fromJson(Map<String, dynamic> json) => AllvalidcodeModel(
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

class Body {
    final int id;
    final String code;
    final double amount;

    Body({
        required this.id,
        required this.code,
        required this.amount,
    });

    Body copyWith({
        int? id,
        String? code,
        double? amount,
    }) => 
        Body(
            id: id ?? this.id,
            code: code ?? this.code,
            amount: amount ?? this.amount,
        );

    factory Body.fromRawJson(String str) => Body.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        id: json["id"],
        code: json["code"],
        amount: json["amount"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "amount": amount,
    };
}
