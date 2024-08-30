import 'package:flutter_test/flutter_test.dart';
import 'package:rental_clean_tdd/features/wallet/data_layer/models/balance_model.dart';
import 'package:rental_clean_tdd/features/wallet/domain_layer/entities/balance_entity.dart';

void main(){
  BalanceModel balanceModel=BalanceModel(
    code: 'code'
  );

  final expextedJsonMap={
    'code': 'code'
  };



  test("HistoryModel is subclass of HistoryEntity", ()async{
    expect(balanceModel, isA<BalanceEntity>());
  });

  //test to json
  test("return a json map", ()async{
    final res=balanceModel.toJson();
    expect(res, expextedJsonMap);
  });

}