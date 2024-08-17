import 'package:equatable/equatable.dart';

class BicycleByCategoryEntity extends Equatable {
  final String? message;
  final String? status;
  final DateTime? localDateTime;
  final List<BodyEntity>? body;

  BicycleByCategoryEntity({
     this.message,
     this.status,
     this.localDateTime,
     this.body,
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

class BodyEntity extends Equatable {
  final int? id;
  final ModelPriceEntity? modelPrice;
  final int? size;
  final String? photoPath;
  final String? type;
  final String? note;
  final List<dynamic>? maintenance;

  BodyEntity({
     this.id,
     this.modelPrice,
     this.size,
     this.photoPath,
     this.type,
     this.note,
     this.maintenance,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    modelPrice,
    size,
    photoPath,
    type,
    note,
    maintenance
  ];
}
class ModelPriceEntity extends Equatable {
  final int? id;
  final double? price;
  final String? model;

  ModelPriceEntity({
     this.id,
     this.price,
     this.model,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    price,
    model
  ];
}