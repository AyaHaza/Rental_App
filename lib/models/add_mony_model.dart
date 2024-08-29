import 'dart:convert';

class AddMonyModel {
    final String code;

    AddMonyModel({
        required this.code,
    });

    AddMonyModel copyWith({
        String? code,
    }) => 
        AddMonyModel(
            code: code ?? this.code,
        );

    factory AddMonyModel.fromRawJson(String str) => AddMonyModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AddMonyModel.fromJson(Map<String, dynamic> json) => AddMonyModel(
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
    };
}
