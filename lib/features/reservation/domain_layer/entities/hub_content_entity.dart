import 'package:equatable/equatable.dart';

class HubContentEntity extends Equatable {
  final String? message;
  final String? status;
  final DateTime? localDateTime;
  final BodyEntity? body;

  HubContentEntity({
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

class BodyEntity extends Equatable{
  final int? id;
  final int? hubId;
  final List<BicycleListEntity>? bicycleList;
  final String? note;

  BodyEntity({
     this.id,
     this.hubId,
     this.bicycleList,
     this.note,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    hubId,
    bicycleList,
    note
  ];
}

class BicycleListEntity extends Equatable{
  final int? id;
  final ModelPriceEntity? modelPrice;
  final String? type;
  final int? size;
  final String? note;
  final List<dynamic>? maintenance;
  final List<dynamic>? extension;
  final int? photoId;
  final dynamic hasOffer;
  final dynamic discountPrice;

  BicycleListEntity({
     this.id,
     this.modelPrice,
     this.type,
     this.size,
     this.note,
     this.maintenance,
     this.extension,
     this.photoId,
     this.hasOffer,
     this.discountPrice,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    modelPrice,
    type,
    size,
    note,
    maintenance,
    extension,
    photoId,
    hasOffer,
    discountPrice
  ];
}

class ModelPriceEntity extends Equatable{
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