import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/core/error/exception.dart';
import 'package:rental_clean_tdd/core/error/failure.dart';
import 'package:rental_clean_tdd/features/wallet/data_layer/repository/wallet_repository_imp.dart';
import 'package:rental_clean_tdd/features/wallet/domain_layer/entities/balance_entity.dart';
import 'package:rental_clean_tdd/features/wallet/domain_layer/entities/wallet_entity.dart';
import 'package:rental_clean_tdd/features/wallet/domain_layer/entities/wallet_info_entity.dart';
import 'package:rental_clean_tdd/features/wallet/domain_layer/entities/wallet_valid_code_entity.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late MockWalletApiService mockWalletApiService;
  late WalletRepositoryImp walletRepositoryImp;

  setUp((){
    mockWalletApiService=MockWalletApiService();
    walletRepositoryImp=WalletRepositoryImp(mockWalletApiService);
  });
  BalanceEntity balanceEntity=BalanceEntity(
      code: 'code'
  );
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
  group('add money to wallet ', (){
    test("success API", ()async{
      when(mockWalletApiService.addMoneyToWallet(balanceEntity)).thenAnswer((_)async=>true);
      final res=await walletRepositoryImp.addMoneyToWallet(balanceEntity);
      expect(res, Right(true));
    });

    test('failure API so return server fauilare', ()async{
      when(mockWalletApiService.addMoneyToWallet(balanceEntity)).thenThrow(ServerException("An error has occurred"));
      final res=await walletRepositoryImp.addMoneyToWallet(balanceEntity);
      expect(res, Left(ServerFailure("An error has occurred")));
    });

    test('no internet so return connection fauilare', ()async{
      when(mockWalletApiService.addMoneyToWallet(balanceEntity)).thenThrow(SocketException("Failed to connect to the network"));
      final res=await walletRepositoryImp.addMoneyToWallet(balanceEntity);
      expect(res, Left(ConnectionFailure("Failed to connect to the network")));
    });
  });

  group('get wallet information', (){
    test("success API", ()async{
      when(mockWalletApiService.getWalletInfo()).thenAnswer((_)async=>walletInfoEntity);
      final res=await walletRepositoryImp.getWalletInfo();
      expect(res, Right(walletInfoEntity));
    });

    test('failure API so return server fauilare', ()async{
      when(mockWalletApiService.getWalletInfo()).thenThrow(ServerException("An error has occurred"));
      final res=await walletRepositoryImp.getWalletInfo();
      expect(res, Left(ServerFailure("An error has occurred")));
    });

    test('no internet so return connection fauilare', ()async{
      when(mockWalletApiService.getWalletInfo()).thenThrow(SocketException("Failed to connect to the network"));
      final res=await walletRepositoryImp.getWalletInfo();
      expect(res, Left(ConnectionFailure("Failed to connect to the network")));
    });
  });

  group('create wallet', (){
    test("success API", ()async{
      when(mockWalletApiService.createWallet(walletEntity)).thenAnswer((_)async=>true);
      final res=await walletRepositoryImp.createWallet(walletEntity);
      expect(res, Right(true));
    });

    test('failure API so return server fauilare', ()async{
      when(mockWalletApiService.getWalletInfo()).thenThrow(ServerException("An error has occurred"));
      final res=await walletRepositoryImp.getWalletInfo();
      expect(res, Left(ServerFailure("An error has occurred")));
    });

    test('no internet so return connection fauilare', ()async{
      when(mockWalletApiService.createWallet(walletEntity)).thenThrow(SocketException("Failed to connect to the network"));
      final res=await walletRepositoryImp.createWallet(walletEntity);
      expect(res, Left(ConnectionFailure("Failed to connect to the network")));
    });
  });

  group('get valid code', (){
    test("success API", ()async{
      when(mockWalletApiService.getValidCode()).thenAnswer((_)async=>walletValidCodeEntity);
      final res=await walletRepositoryImp.getValidCode();
      expect(res, Right(walletValidCodeEntity));
    });

    test('failure API so return server fauilare', ()async{
      when(mockWalletApiService.getWalletInfo()).thenThrow(ServerException("An error has occurred"));
      final res=await walletRepositoryImp.getWalletInfo();
      expect(res, Left(ServerFailure("An error has occurred")));
    });

    test('no internet so return connection fauilare', ()async{
      when(mockWalletApiService.getWalletInfo()).thenThrow(SocketException("Failed to connect to the network"));
      final res=await walletRepositoryImp.getWalletInfo();
      expect(res, Left(ConnectionFailure("Failed to connect to the network")));
    });
  });

}