import 'dart:convert';

class CreateWalletModel {
    final String securityCode;
    final String confirmSecurityCode;
    final String bankAccount;

    CreateWalletModel({
        required this.securityCode,
        required this.confirmSecurityCode,
        required this.bankAccount,
    });

    CreateWalletModel copyWith({
        String? securityCode,
        String? confirmSecurityCode,
        String? bankAccount,
    }) => 
        CreateWalletModel(
            securityCode: securityCode ?? this.securityCode,
            confirmSecurityCode: confirmSecurityCode ?? this.confirmSecurityCode,
            bankAccount: bankAccount ?? this.bankAccount,
        );

    factory CreateWalletModel.fromRawJson(String str) => CreateWalletModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateWalletModel.fromJson(Map<String, dynamic> json) => CreateWalletModel(
        securityCode: json["securityCode"],
        confirmSecurityCode: json["confirmSecurityCode"],
        bankAccount: json["bankAccount"],
    );

    Map<String, dynamic> toJson() => {
        "securityCode": securityCode,
        "confirmSecurityCode": confirmSecurityCode,
        "bankAccount": bankAccount,
    };
}
