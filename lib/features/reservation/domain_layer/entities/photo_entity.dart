import 'package:equatable/equatable.dart';

class PhotoEntity extends Equatable{
  final String? message;
  final String? status;
  final DateTime? localDateTime;
  final List<BodyEntity>? body;

  PhotoEntity({
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
  final String? fileName;
  final String? filePath;
  final String? fileType;
  final int? fileSize;
  final String? relationType;
  final dynamic relationId;

  BodyEntity({
     this.id,
     this.fileName,
     this.filePath,
     this.fileType,
     this.fileSize,
     this.relationType,
     this.relationId,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    fileName,
    filePath,
    fileType,
    fileSize,
    relationType,
    relationId
  ];
}