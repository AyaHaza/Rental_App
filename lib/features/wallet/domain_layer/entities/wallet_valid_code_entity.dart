import 'package:equatable/equatable.dart';

class WalletValidCodeEntity extends Equatable{
  final String message;
  final String status;
  final DateTime localDateTime;
  final List<Body> body;

  WalletValidCodeEntity({
    required this.message,
    required this.status,
    required this.localDateTime,
    required this.body,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>[
    message,
    status,localDateTime,
    body
  ];
}
class Body extends Equatable{
  final int id;
  final String code;
  final double amount;

  Body({
    required this.id,
    required this.code,
    required this.amount,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>[
    id,
    code,
    amount
  ];
}