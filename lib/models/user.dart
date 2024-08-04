
import 'dart:convert';

UserModelT userModelFromJson(String str) => UserModelT.fromJson(json.decode(str));

String userModelToJson(UserModelT data) => json.encode(data.toJson());

class UserModelT  {
  String? phone;
  String? password;

  UserModelT({
    this.phone,
    this.password,
  });

  factory UserModelT.fromJson(Map<String, dynamic> json) => UserModelT(
    phone: json["phone"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "password": password,
  };

}
