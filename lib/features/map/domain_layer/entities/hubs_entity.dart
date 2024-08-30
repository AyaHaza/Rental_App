import 'package:equatable/equatable.dart';

class HubsEntity extends Equatable{
  final int? id;
  final String? name;
  final double? latitude;
  final double? longitude;
  final String? description;

  HubsEntity({
     this.id,
     this.name,
     this.latitude,
     this.longitude,
     this.description,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>[
    id,
    name,
    latitude,
    longitude,
    description
  ];
}