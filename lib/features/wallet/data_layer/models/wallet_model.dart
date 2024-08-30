import 'dart:convert';

import '../../domain_layer/entities/wallet_entity.dart';


class WalletModel extends WalletEntity{

  WalletModel({
    required super.securityCode,
    required super.confirmSecurityCode,
    required super.bankAccount,
  });

  WalletModel copyWith({
    String? securityCode,
    String? confirmSecurityCode,
    String? bankAccount,
  }) =>
      WalletModel(
        securityCode: securityCode ?? this.securityCode,
        confirmSecurityCode: confirmSecurityCode ?? this.confirmSecurityCode,
        bankAccount: bankAccount ?? this.bankAccount,
      );

  factory WalletModel.fromEntity(WalletEntity json) => WalletModel(
    securityCode: json.securityCode,
    confirmSecurityCode: json.confirmSecurityCode,
    bankAccount: json.bankAccount,
  );

  Map<String, dynamic> toJson() => {
    "securityCode": securityCode,
    "confirmSecurityCode": confirmSecurityCode,
    "bankAccount": bankAccount,
  };
}
