

import '../../domain_layer/entities/user_regiser_entity.dart';

class UserRegisterModel extends UserRegisterEntity {

  UserRegisterModel({
    super.firstName,
    super.lastName,
    super.phone,
    super.username,
    super.birthDate,
    super.password,
    super.confirmPassword,
  });

  factory UserRegisterModel.fromJson(UserRegisterEntity json) => UserRegisterModel(
    firstName: json.firstName,
    lastName: json.lastName,
    phone: json.phone,
    username: json.username,
    birthDate: DateTime.parse(json.birthDate.toString()),
    password: json.password,
    confirmPassword: json.confirmPassword,
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "phone": phone,
    "username": username,
    "birthDate": "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
    "password": password,
    "confirmPassword": confirmPassword,
  };

}
