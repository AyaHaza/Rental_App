import 'package:equatable/equatable.dart';

class PolicyEntity extends Equatable{
  final String message;
  final String status;
  final DateTime localDateTime;
  final BodyPolicy body;

  PolicyEntity({
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

class BodyPolicy extends Equatable{
  final int id;
  final String title;
  final String description;

  BodyPolicy({
    required this.id,
    required this.title,
    required this.description,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>[
    id,
    title,
    description
  ];
}