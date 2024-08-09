

import '../../domain_layer/entities/user_login_entity.dart';

class UserLoginModel extends UserLoginEntity  {
  UserLoginModel({
    super.phone,
    super.password,
  });

  factory UserLoginModel.fromJson(UserLoginEntity json) => UserLoginModel(
    phone: json.phone,
    password: json.password,
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "password": password,
  };

}
