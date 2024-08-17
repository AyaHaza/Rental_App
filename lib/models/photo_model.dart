class PhotoModel {
  String message;
  String status;
  DateTime localDateTime;
  List<Body> body;

  PhotoModel({
    required this.message,
    required this.status,
    required this.localDateTime,
    required this.body,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) => PhotoModel(
    message: json["message"],
    status: json["status"],
    localDateTime: DateTime.parse(json["localDateTime"]),
    body: List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "localDateTime": localDateTime.toIso8601String(),
    "body": List<dynamic>.from(body.map((x) => x.toJson())),
  };
}

class Body {
  int id;
  String fileName;
  String filePath;
  String fileType;
  int fileSize;
  String relationType;
  dynamic relationId;

  Body({
    required this.id,
    required this.fileName,
    required this.filePath,
    required this.fileType,
    required this.fileSize,
    required this.relationType,
    required this.relationId,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
    id: json["id"],
    fileName: json["fileName"],
    filePath: json["filePath"],
    fileType: json["fileType"],
    fileSize: json["fileSize"],
    relationType: json["relationType"],
    relationId: json["relationId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fileName": fileName,
    "filePath": filePath,
    "fileType": fileType,
    "fileSize": fileSize,
    "relationType": relationType,
    "relationId": relationId,
  };
}
