
import '../../domain_layer/entities/policy_entity.dart';

class PolicyModel extends PolicyEntity {

  PolicyModel({
    required super.message,
    required super.status,
    required super.localDateTime,
    required super.body,
  });

  factory PolicyModel.fromJson(Map<String, dynamic> json) => PolicyModel(
    message: json["message"],
    status: json["status"],
    localDateTime: DateTime.parse(json["localDateTime"]),
    body: BodyPolicyModel.fromJson(json["body"]),
  );
}

class BodyPolicyModel extends BodyPolicy {

  BodyPolicyModel({
    required super.id,
    required super.title,
    required super.description,
  });

  factory BodyPolicyModel.fromJson(Map<String, dynamic> json) => BodyPolicyModel(
    id: json["id"],
    title: json["title"],
    description: json["description"],
  );
}
