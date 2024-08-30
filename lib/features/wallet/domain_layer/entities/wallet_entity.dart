import 'package:equatable/equatable.dart';

class WalletEntity extends Equatable{
  final String securityCode;
  final String confirmSecurityCode;
  final String bankAccount;

  WalletEntity({
    required this.securityCode,
    required this.confirmSecurityCode,
    required this.bankAccount,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    securityCode,
    confirmSecurityCode,
    bankAccount
  ];
}