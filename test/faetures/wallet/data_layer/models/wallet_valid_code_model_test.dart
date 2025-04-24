import 'package:flutter_test/flutter_test.dart';
import 'package:rental_clean_tdd/features/wallet/data_layer/models/wallet_valid_code_model.dart';
import 'package:rental_clean_tdd/features/wallet/domain_layer/entities/wallet_valid_code_entity.dart';

void main(){
  WalletValidCodeModel walletModel=WalletValidCodeModel(
      message: 'message',
      localDateTime: DateTime(2022-11-11),
      status: '',
      body: [BodyModel(
          id: 1,
          code: 'code',
          amount: 200.2
      )]
  );

  final expextedJsonMap={
    'message': 'message',
    'localDateTime':'2022-11-11',
    'status': '',
    'body': [{
      'id': 1,
      'code': 'code',
      'amount': 200.2
    }]
  };



  test("HistoryModel is subclass of HistoryEntity", ()async{
    expect(walletModel, isA<WalletValidCodeEntity>());
  });


  test(
      "should be return a vaild from json ", ()async{
    final res=WalletValidCodeModel.fromJson(expextedJsonMap);
    expect(res,isA<WalletValidCodeModel>());
  }
  );

}