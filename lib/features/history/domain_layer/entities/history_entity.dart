import 'package:equatable/equatable.dart';

class HistoryEntity extends Equatable {
  final int? id;
  final String? statrPoint;
  final String? destinationPoint;

  HistoryEntity({
     this.id,
     this.statrPoint,
     this.destinationPoint,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>[
    statrPoint,
    destinationPoint
  ];
}