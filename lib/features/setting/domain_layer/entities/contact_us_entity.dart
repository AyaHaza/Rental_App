import 'package:equatable/equatable.dart';

class ContactUsEntity extends Equatable {
  final String name;
  final String email;
  final String number;
  final String message;

  ContactUsEntity({
    required this.name,
    required this.email,
    required this.number,
    required this.message,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>[
    name,
    email,
    number,
    message
  ];

}