import 'package:rental_clean_tdd/features/reservation/domain_layer/entities/photo_entity.dart';

class PhotoModel extends PhotoEntity {

  PhotoModel({
     super.message,
     super.status,
     super.localDateTime,
     super.body,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) => PhotoModel(
    message: json["message"],
    status: json["status"],
    localDateTime: DateTime.parse(json["localDateTime"]),
    body: List<BodyModel>.from(json["body"].map((x) => BodyModel.fromJson(x))),
  );
}

class BodyModel extends BodyEntity {

  BodyModel({
     super.id,
     super.fileName,
     super.filePath,
     super.fileType,
     super.fileSize,
     super.relationType,
     super.relationId,
  });

  factory BodyModel.fromJson(Map<String, dynamic> json) => BodyModel(
    id: json["id"],
    fileName: json["fileName"],
    filePath: json["filePath"],
    fileType: json["fileType"],
    fileSize: json["fileSize"],
    relationType: json["relationType"],
    relationId: json["relationId"],
  );
}
