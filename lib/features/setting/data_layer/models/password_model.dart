
import '../../domain_layer/entities/password_entity.dart';


class PasswordModel extends PasswordEntity {
  PasswordModel({
    required super.currentPassword,
    required super.newPassword,
    required super.confirmPassword,
  });

  factory PasswordModel.fromJson(PasswordEntity json) => PasswordModel(
    currentPassword: json.currentPassword,
    newPassword: json.newPassword,
    confirmPassword: json.confirmPassword,
  );

  Map<String, dynamic> toJson() => {
    "currentPassword": currentPassword,
    "newPassword": newPassword,
    "confirmPassword": confirmPassword,
  };
}
