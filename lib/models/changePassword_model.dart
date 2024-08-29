import 'dart:convert';

class ChangePasswordModel {
    final String currentPassword;
    final String newPassword;
    final String confirmPassword;

    ChangePasswordModel({
        required this.currentPassword,
        required this.newPassword,
        required this.confirmPassword,
    });

    ChangePasswordModel copyWith({
        String? currentPassword,
        String? newPassword,
        String? confirmPassword,
    }) => 
        ChangePasswordModel(
            currentPassword: currentPassword ?? this.currentPassword,
            newPassword: newPassword ?? this.newPassword,
            confirmPassword: confirmPassword ?? this.confirmPassword,
        );

    factory ChangePasswordModel.fromRawJson(String str) => ChangePasswordModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ChangePasswordModel.fromJson(Map<String, dynamic> json) => ChangePasswordModel(
        currentPassword: json["currentPassword"],
        newPassword: json["newPassword"],
        confirmPassword: json["confirmPassword"],
    );

    Map<String, dynamic> toJson() => {
        "currentPassword": currentPassword,
        "newPassword": newPassword,
        "confirmPassword": confirmPassword,
    };
}
