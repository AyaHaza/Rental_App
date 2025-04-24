import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/core/error/failure.dart';
import 'package:rental_clean_tdd/features/wallet/domain_layer/entities/balance_entity.dart';
import 'package:rental_clean_tdd/features/wallet/domain_layer/entities/wallet_entity.dart';
import 'package:rental_clean_tdd/features/wallet/domain_layer/entities/wallet_info_entity.dart';
import 'package:rental_clean_tdd/features/wallet/presentaion_layer/bloc/bloc.dart';
import 'package:rental_clean_tdd/features/wallet/presentaion_layer/bloc/events.dart';
import 'package:rental_clean_tdd/features/wallet/presentaion_layer/bloc/states.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late MockAddMoneyToWalletUsecase mockAddMoneyToWalletUsecase;
  late MockCreateWalletUsecase mockCreateWalletUsecase;
  late MockGetWalletInfoUsecase mockGetWalletInfoUsecase;
  late WalletBloc walletBloc;

  setUp((){

    mockAddMoneyToWalletUsecase=MockAddMoneyToWalletUsecase();
    mockCreateWalletUsecase=MockCreateWalletUsecase();
    mockGetWalletInfoUsecase=MockGetWalletInfoUsecase();
    walletBloc=WalletBloc(mockCreateWalletUsecase,mockGetWalletInfoUsecase,mockAddMoneyToWalletUsecase);
  });

  WalletInfoEntity walletEntity=WalletInfoEntity(
      message: 'message',
      localDateTime: DateTime(2022-11-11),
      status: '',
      body: BodyWalletInfo(
          id: 1,
          bankAccount: 'bankAccount',
          balance: 22.22
      )
  );

  WalletEntity craetewalletEntity=WalletEntity(
      securityCode: 'securityCode',
      confirmSecurityCode: 'confirmSecurityCode',
      bankAccount: 'bankAccount'
  );

  BalanceEntity balanceEntity=BalanceEntity(
      code: 'code'
  );

  group('get wallet information', (){
    blocTest<WalletBloc,WalletState>(
        'should emit [LoadingState,SuccessState] when data is gotten successfully"',
        build: (){
          when(mockGetWalletInfoUsecase.call('get')).thenAnswer((_)async=>Right(walletEntity));
          return walletBloc;
        },
        act: (bloc)=>bloc.add(GetWalletInfo()),
        expect: ()=>[
          isA<LoadingState>(),
          isA<SuccessState>()
        ]
    );

    blocTest<WalletBloc,WalletState>(
        'should emit [MapError] when data is gotten unsuccessfully"',
        build: (){
          when(mockGetWalletInfoUsecase.call('get')).thenAnswer((_)async=>Left(ConnectionFailure("Failed to connect to the network")));
          return walletBloc;
        },
        act: (bloc)=>bloc.add(GetWalletInfo()),
        expect: ()=>[
          isA<LoadingState>(),
          isA<ErrorState>()
        ]
    );
  });

  group('create wallet ', (){
    blocTest<WalletBloc,WalletState>(
        'should emit [LoadingState,SuccessState] when data is gotten successfully"',
        build: (){
          when(mockCreateWalletUsecase.call(craetewalletEntity)).thenAnswer((_)async=>Right(true));
          return walletBloc;
        },
        act: (bloc)=>bloc.add(CreateWalletEvent(craetewalletEntity)),
        expect: ()=>[
          isA<LoadingState>(),
          isA<SuccessState>()
        ]
    );

    blocTest<WalletBloc,WalletState>(
        'should emit [MapError] when data is gotten unsuccessfully"',
        build: (){
          when(mockCreateWalletUsecase.call(craetewalletEntity)).thenAnswer((_)async=>Left(ConnectionFailure("Failed to connect to the network")));
          return walletBloc;
        },
        act: (bloc)=>bloc.add(CreateWalletEvent(craetewalletEntity)),
        expect: ()=>[
          isA<LoadingState>(),
          isA<ErrorState>()
        ]
    );
  });

  group('add money to wallet ', (){
    blocTest<WalletBloc,WalletState>(
        'should emit [LoadingState,SuccessState] when data is gotten successfully"',
        build: (){
          when(mockAddMoneyToWalletUsecase.call(balanceEntity)).thenAnswer((_)async=>Right(true));
          return walletBloc;
        },
        act: (bloc)=>bloc.add(EditeWalletEvent(balanceEntity)),
        expect: ()=>[
          isA<LoadingState>(),
          isA<SuccessBoolState>()
        ]
    );

    blocTest<WalletBloc,WalletState>(
        'should emit [MapError] when data is gotten unsuccessfully"',
        build: (){
          when(mockAddMoneyToWalletUsecase.call(balanceEntity)).thenAnswer((_)async=>Left(ConnectionFailure("Failed to connect to the network")));
          return walletBloc;
        },
        act: (bloc)=>bloc.add(EditeWalletEvent(balanceEntity)),
        expect: ()=>[
          isA<LoadingState>(),
          isA<ErrorState>()
        ]
    );
  });

}