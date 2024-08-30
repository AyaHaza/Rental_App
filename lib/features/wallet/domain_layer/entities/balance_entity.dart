import 'package:equatable/equatable.dart';

class BalanceEntity extends Equatable {
  final String code;

  BalanceEntity({
    required this.code,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    code
  ];
}