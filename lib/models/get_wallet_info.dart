import 'dart:convert';

class GetWalletInfoModel {
    final String message;
    final String status;
    final DateTime localDateTime;
    final Body body;

    GetWalletInfoModel({
        required this.message,
        required this.status,
        required this.localDateTime,
        required this.body,
    });

    GetWalletInfoModel copyWith({
        String? message,
        String? status,
        DateTime? localDateTime,
        Body? body,
    }) => 
        GetWalletInfoModel(
            message: message ?? this.message,
            status: status ?? this.status,
            localDateTime: localDateTime ?? this.localDateTime,
            body: body ?? this.body,
        );

    factory GetWalletInfoModel.fromRawJson(String str) => GetWalletInfoModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetWalletInfoModel.fromJson(Map<String, dynamic> json) => GetWalletInfoModel(
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
    final double balance;
    final String bankAccount;

    Body({
        required this.id,
        required this.balance,
        required this.bankAccount,
    });

    Body copyWith({
        int? id,
        double? balance,
        String? bankAccount,
    }) => 
        Body(
            id: id ?? this.id,
            balance: balance ?? this.balance,
            bankAccount: bankAccount ?? this.bankAccount,
        );

    factory Body.fromRawJson(String str) => Body.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        id: json["id"],
        balance: json["balance"],
        bankAccount: json["bankAccount"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "balance": balance,
        "bankAccount": bankAccount,
    };
}
