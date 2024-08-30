import 'package:equatable/equatable.dart';

class BicycleSupaEntity extends Equatable{
  int? id;
  String? modelName;
  double? price;
  int? size;
  String? note;
  String? type;
  String? photoPath;

  BicycleSupaEntity({
     this.id,
     this.modelName,
     this.price,
     this.size,
     this.note,
     this.type,
     this.photoPath,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    modelName,
    price,
    size,
    note,
    type,
    photoPath
  ];
}