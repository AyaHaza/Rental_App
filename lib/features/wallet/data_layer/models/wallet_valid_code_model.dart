import 'dart:convert';

import '../../domain_layer/entities/wallet_valid_code_entity.dart';


class WalletValidCodeModel extends WalletValidCodeEntity {

  WalletValidCodeModel({
    required super.message,
    required super.status,
    required super.localDateTime,
    required super.body,
  });

  factory WalletValidCodeModel.fromJson(Map<String, dynamic> json) => WalletValidCodeModel(
    message: json["message"],
    status: json["status"],
    localDateTime: DateTime.parse(json["localDateTime"]),
    body: List<Body>.from(json["body"].map((x) => BodyModel.fromJson(x))),
  );

}

class BodyModel extends Body{

  BodyModel({
    required super.id,
    required super.code,
    required super.amount,
  });

  factory BodyModel.fromJson(Map<String, dynamic> json) => BodyModel(
    id: json["id"],
    code: json["code"],
    amount: json["amount"],
  );

}
