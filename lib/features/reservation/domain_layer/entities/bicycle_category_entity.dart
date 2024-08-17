import 'package:equatable/equatable.dart';

class BicycleCategoryEntity extends Equatable{
  final String? message;
  final String? status;
  final DateTime? localDateTime;
  final List<String>? body;

  BicycleCategoryEntity({
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