import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:rental_clean_tdd/core/resources/variable.dart';
import 'package:rental_clean_tdd/features/wallet/data_layer/data_source/remote/wallet_api_service_imp.dart';
import 'package:rental_clean_tdd/features/wallet/data_layer/models/balance_model.dart';
import 'package:rental_clean_tdd/features/wallet/data_layer/models/wallet_info_model.dart';
import 'package:rental_clean_tdd/features/wallet/data_layer/models/wallet_model.dart';
import 'package:rental_clean_tdd/features/wallet/data_layer/models/wallet_valid_code_model.dart';
import 'package:rental_clean_tdd/features/wallet/domain_layer/entities/balance_entity.dart';
import 'package:rental_clean_tdd/features/wallet/domain_layer/entities/wallet_entity.dart';
import 'package:rental_clean_tdd/features/wallet/domain_layer/entities/wallet_info_entity.dart';
import 'package:rental_clean_tdd/features/wallet/domain_layer/entities/wallet_valid_code_entity.dart';

void main(){
  late Dio mockDio;
  late DioAdapter dioAdapter;
  late WalletApiServiceImp walletApiServiceImp;

  setUp((){
    mockDio=Dio();
    dioAdapter = DioAdapter(
      dio: mockDio,
      matcher: const FullHttpRequestMatcher(),
    );
    walletApiServiceImp =WalletApiServiceImp(mockDio);
  });

  final headers = <String, dynamic>{
    'accept':'*/*',
    'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMjIyODg3NzkxIiwiaWF0IjoxNzI0ODczODIxLCJleHAiOjE3MjQ5NjAyMjF9'
  };

  BalanceEntity balanceEntity=BalanceEntity(
      code: 'code'
  );
  final  _databalanceEntity = jsonEncode(BalanceModel.fromEntity(balanceEntity));

  WalletInfoEntity walletInfoEntity=WalletInfoEntity(
      message: 'message',
      localDateTime: DateTime(2022-11-11),
      status: '',
      body: BodyWalletInfo(
          id: 1,
          bankAccount: 'bankAccount',
          balance: 22.22
      )
  );
  WalletEntity walletEntity=WalletEntity(
      securityCode: 'securityCode',
      confirmSecurityCode: 'confirmSecurityCode',
      bankAccount: 'bankAccount'
  );
  final  _dataWalletEntity = jsonEncode(WalletModel.fromEntity(walletEntity));

  WalletValidCodeEntity walletValidCodeEntity=WalletValidCodeEntity(
      message: 'message',
      localDateTime: DateTime(2022-11-11),
      status: '',
      body: [Body(
          id: 1,
          code: 'code',
          amount: 200.2
      )]
  );
  group('add money to wallet', (){
    test("the response code is 200", ()async{
      dioAdapter.onPut(baseUrl + WalletInfo, (server) => server.reply(200,true),
          data: _databalanceEntity,
          headers: headers
      );
      final res=await walletApiServiceImp.addMoneyToWallet(balanceEntity);
      expect(res, true);
    });

    test("the response code is 400", ()async{
      dioAdapter.onPut(
          baseUrl + WalletInfo, (server) => server.throws(
        400,
        DioException(
          requestOptions: RequestOptions(
            path: baseUrl + WalletInfo,
          ),
        ),
      ),
          data: _databalanceEntity,
          headers: headers
      );
      final res=()async=>await walletApiServiceImp.addMoneyToWallet(balanceEntity);
      expect(res,throwsA(isA<SocketException>()));
    });
  });

  group('craete wallet', (){
    test("the response code is 200", ()async{
      dioAdapter.onPost(baseUrl + WalletInfo, (server) => server.reply(200,true),
          data: _dataWalletEntity,
          headers: headers
      );
      final res=await walletApiServiceImp.createWallet(walletEntity);
      expect(res, true);
    });

    test("the response code is 400", ()async{
      dioAdapter.onPut(
          baseUrl + WalletInfo, (server) => server.throws(
        400,
        DioException(
          requestOptions: RequestOptions(
            path: baseUrl + WalletInfo,
          ),
        ),
      ),
          data: _dataWalletEntity,
          headers: headers
      );
      final res=()async=>await walletApiServiceImp.createWallet(walletEntity);
      expect(res,throwsA(isA<DioException>()));
    });
  });


  group('get valid vode', (){
    test(" the response code is 200", ()async{
      dioAdapter.onGet(baseUrl + WalletInfo + getAllvalidapi, (server) => server.reply(200,{
        'message': 'message',
        'localDateTime': '2022-11-11',
        'status': '',
        'body': [{
          'id': 1,
          'code': 'code',
          'amount': 200.2
        }]
      }),
          headers: headers
      );
      final res=await walletApiServiceImp.getValidCode();
      expect(res, isA<WalletValidCodeModel>());
    });

    test(" the response code is 400", ()async{
      dioAdapter.onGet(baseUrl + WalletInfo + getAllvalidapi, (server) => server.throws(
        400,
        DioException(
          requestOptions: RequestOptions(
            path: baseUrl + WalletInfo + getAllvalidapi,
          ),
        ),
      ),
          headers: headers
      );
      final res=()async=>await walletApiServiceImp.getValidCode();
      expect(res,throwsA(isA<SocketException>()));
    });
  });

  group('get wallet inf', (){
    test(" the response code is 200", ()async{
      dioAdapter.onGet(baseUrl + WalletInfo, (server) => server.reply(200,{
        'message': 'message',
        'localDateTime': '2022-11-11',
        'status': 'status',
        'body': {
          'id': 1,
          'bankAccount': 'bankAccount',
          'balance': 22.22
        }
      }),
          headers: headers
      );
      final res=await walletApiServiceImp.getWalletInfo();
      expect(res, isA<WalletInfoModel>());
    });

    test(" the response code is 400", ()async{
      dioAdapter.onGet(baseUrl + WalletInfo, (server) => server.throws(
        400,
        DioException(
          requestOptions: RequestOptions(
            path: baseUrl + WalletInfo,
          ),
        ),
      ),
          headers: headers
      );
      final res=()async=>await walletApiServiceImp.getWalletInfo();
      expect(res,throwsA(isA<SocketException>()));
    });
  });

}