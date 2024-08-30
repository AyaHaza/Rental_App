import 'package:flutter_test/flutter_test.dart';
import 'package:rental_clean_tdd/features/wallet/data_layer/models/wallet_info_model.dart';
import 'package:rental_clean_tdd/features/wallet/domain_layer/entities/wallet_info_entity.dart';

void main(){
  WalletInfoModel walletInfoModel=WalletInfoModel(
      message: 'message',
      localDateTime: DateTime(2022-11-11),
      status: 'status',
      body: BodyModel(
          id: 1,
          bankAccount: 'bankAccount',
          balance: 22.22
      )

  );

  final expextedJsonMap={
    'message': 'message',
    'localDateTime': '2022-11-11',
    'status': 'status',
    'body': {
      'id': 1,
      'bankAccount': 'bankAccount',
      'balance': 22.22
    }
  };

  test("WalletInfoModel is subclass of WalletInfoEntity", ()async{
    expect(walletInfoModel, isA<WalletInfoEntity>());
  });

  //test from json
  test(
      "should be return a vaild from json ", ()async{
    final res=WalletInfoModel.fromJson(expextedJsonMap);
    expect(res,isA<WalletInfoModel>());
  }
  );

}