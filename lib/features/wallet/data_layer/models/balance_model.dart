
import '../../domain_layer/entities/balance_entity.dart';

class BalanceModel extends BalanceEntity {
  BalanceModel({
    required super.code,
  });

  factory BalanceModel.fromEntity(BalanceEntity json) => BalanceModel(
    code: json.code,
  );

  Map<String, dynamic> toJson() => {
    "code": code,
  };
}
