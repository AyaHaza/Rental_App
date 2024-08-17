import 'package:equatable/equatable.dart';

class HubsEntity extends Equatable{
  int? id;
  String? name;
  double? latitude;
  double? longitude;
  String? description;

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