import 'dart:convert';

import '../../domain_layer/entities/wallet_info_entity.dart';


class WalletInfoModel extends WalletInfoEntity {
  WalletInfoModel({
    required super.message,
    required super.status,
    required super.localDateTime,
    required super.body,
  });

  factory WalletInfoModel.fromJson(Map<String, dynamic> json) => WalletInfoModel(
    message: json["message"],
    status: json["status"],
    localDateTime: DateTime.parse(json["localDateTime"]),
    body: BodyModel.fromJson(json["body"]),
  );
}


class BodyModel extends BodyWalletInfo {

  BodyModel({
    required super.id,
    required super.balance,
    required super.bankAccount,
  });

  factory BodyModel.fromJson(Map<String, dynamic> json) => BodyModel(
    id: json["id"],
    balance: json["balance"],
    bankAccount: json["bankAccount"],
  );
}
