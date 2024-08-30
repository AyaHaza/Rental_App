import 'package:flutter_test/flutter_test.dart';
import 'package:rental_clean_tdd/features/wallet/data_layer/models/wallet_model.dart';
import 'package:rental_clean_tdd/features/wallet/domain_layer/entities/wallet_entity.dart';

void main(){
  WalletModel walletModel=WalletModel(
    securityCode:'securityCode',
    confirmSecurityCode: 'confirmSecurityCode',
    bankAccount: 'bankAccount'
  );

  final expextedJsonMap={
    'securityCode':'securityCode',
    'confirmSecurityCode': 'confirmSecurityCode',
    'bankAccount': 'bankAccount'
  };



  test("HistoryModel is subclass of HistoryEntity", ()async{
    expect(walletModel, isA<WalletEntity>());
  });

  //test to json
  test("return a json map", ()async{
    final res=walletModel.toJson();
    expect(res, expextedJsonMap);
  });

}