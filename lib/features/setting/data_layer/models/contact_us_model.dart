import 'dart:convert';

import 'package:rental_clean_tdd/features/setting/domain_layer/entities/contact_us_entity.dart';

class ContactUsModel extends ContactUsEntity {

  ContactUsModel({
    required super.name,
    required super.email,
    required super.number,
    required super.message,
  });

  factory ContactUsModel.fromJson(ContactUsEntity json) => ContactUsModel(
    name: json.name,
    email: json.email,
    number: json.number,
    message: json.message,
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "number": number,
    "message": message,
  };
}
