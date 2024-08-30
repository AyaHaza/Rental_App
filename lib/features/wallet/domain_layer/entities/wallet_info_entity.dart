import 'package:equatable/equatable.dart';

class WalletInfoEntity extends Equatable{
  final String message;
  final String status;
  final DateTime localDateTime;
  final BodyWalletInfo body;

  WalletInfoEntity({
    required this.message,
    required this.status,
    required this.localDateTime,
    required this.body,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    message,
    status,
    localDateTime,
    body
  ];
}
class BodyWalletInfo extends Equatable{
  final int id;
  final double balance;
  final String bankAccount;

  BodyWalletInfo({
    required this.id,
    required this.balance,
    required this.bankAccount,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    balance,
    bankAccount
  ];
}