import 'dart:convert';

class ContactUsModel {
    final String name;
    final String email;
    final String number;
    final String message;

    ContactUsModel({
        required this.name,
        required this.email,
        required this.number,
        required this.message,
    });

    ContactUsModel copyWith({
        String? name,
        String? email,
        String? number,
        String? message,
    }) => 
        ContactUsModel(
            name: name ?? this.name,
            email: email ?? this.email,
            number: number ?? this.number,
            message: message ?? this.message,
        );

    factory ContactUsModel.fromRawJson(String str) => ContactUsModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ContactUsModel.fromJson(Map<String, dynamic> json) => ContactUsModel(
        name: json["name"],
        email: json["email"],
        number: json["number"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "number": number,
        "message": message,
    };
}
