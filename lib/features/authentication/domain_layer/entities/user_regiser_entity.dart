
import 'package:equatable/equatable.dart';

class UserRegisterEntity extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? username;
  final DateTime? birthDate;
  final String? password;
  final String? confirmPassword;

  UserRegisterEntity({
    this.firstName,
    this.lastName,
    this.phone,
    this.username,
    this.birthDate,
    this.password,
    this.confirmPassword,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    firstName,
    lastName,
    phone,
    username,
    birthDate,
    password,
    confirmPassword
  ];

}
