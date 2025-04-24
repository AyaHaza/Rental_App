import 'package:equatable/equatable.dart';

class PasswordEntity extends Equatable {
  final String currentPassword;
  final String newPassword;
  final String confirmPassword;

  PasswordEntity({
    required this.currentPassword,
    required this.newPassword,
    required this.confirmPassword,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>[
    currentPassword,
    newPassword,
    confirmPassword
  ];
}