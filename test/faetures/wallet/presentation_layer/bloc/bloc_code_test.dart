import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/core/error/failure.dart';
import 'package:rental_clean_tdd/features/wallet/domain_layer/entities/wallet_valid_code_entity.dart';
import 'package:rental_clean_tdd/features/wallet/presentaion_layer/bloc/bloc_code.dart';
import 'package:rental_clean_tdd/features/wallet/presentaion_layer/bloc/events.dart';
import 'package:rental_clean_tdd/features/wallet/presentaion_layer/bloc/states.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late MockGetValidCodeUsecase mockGetValidCodeUsecase;
  late BlocCode blocCode;

  setUp((){

    mockGetValidCodeUsecase=MockGetValidCodeUsecase();
    blocCode=BlocCode(mockGetValidCodeUsecase);
  });

  WalletValidCodeEntity walletEntity=WalletValidCodeEntity(
      message: 'message',
      localDateTime: DateTime(2022-11-11),
      status: '',
      body: [Body(
          id: 1,
          code: 'code',
          amount: 200.2
      )]
  );

  group('get vaild code', (){
    blocTest<BlocCode,WalletState>(
        'should emit [LoadingState,SuccessState] when data is gotten successfully"',
        build: (){
          when(mockGetValidCodeUsecase.call('get')).thenAnswer((_)async=>Right(walletEntity));
          return blocCode;
        },
        act: (bloc)=>bloc.add(GetAllvalidCodeEvent()),
        expect: ()=>[
          isA<LoadingState>(),
          isA<SuccessState>()
        ]
    );

    blocTest<BlocCode,WalletState>(
        'should emit [MapError] when data is gotten unsuccessfully"',
        build: (){
          when(mockGetValidCodeUsecase.call('get')).thenAnswer((_)async=>Left(ConnectionFailure("Failed to connect to the network")));
          return blocCode;
        },
        act: (bloc)=>bloc.add(GetAllvalidCodeEvent()),
        expect: ()=>[
          isA<LoadingState>(),
          isA<ErrorState>()
        ]
    );
  });


}