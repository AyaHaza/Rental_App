
import 'package:equatable/equatable.dart';

class FavoriteEntity extends Equatable{
  final String message;
  final String status;
  final DateTime localDateTime;
  final List<BodyFav> body;

  FavoriteEntity({
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

class BodyFav extends Equatable{
  final int id;
  final Bicycle bicycle;
  final Client client;

  BodyFav({
    required this.id,
    required this.bicycle,
    required this.client,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    bicycle,
    client
  ];
}

class Bicycle extends Equatable{
  final int id;
  final ModelPrice modelPrice;
  final int size;
  final dynamic photoPath;
  final String type;
  final String note;
  final List<dynamic> maintenance;

  Bicycle({
    required this.id,
    required this.modelPrice,
    required this.size,
    required this.photoPath,
    required this.type,
    required this.note,
    required this.maintenance,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>[
    id,
    modelPrice,
    size,
    photoPath,
    type,
    note,
    maintenance
  ];
}

class ModelPrice extends Equatable{
  final int id;
  double price;
  final String model;

  ModelPrice({
    required this.id,
    required this.price,
    required this.model,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    price,
    model
  ];
}

class Client extends Equatable{
  final int id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String username;
  final DateTime birthDate;

  Client({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.username,
    required this.birthDate,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>[
    id,
    firstName,
    lastName,
    phoneNumber,
    username,
    birthDate
  ];

}
