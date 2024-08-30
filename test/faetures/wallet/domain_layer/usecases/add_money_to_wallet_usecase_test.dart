import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/features/wallet/domain_layer/entities/balance_entity.dart';
import 'package:rental_clean_tdd/features/wallet/domain_layer/usecases/add_money_to_wallet_usecase.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late AddMoneyToWalletUsecase addMoneyToWalletUsecase;
  late MockWalletRepository mockWalletRepository;
  setUp((){
    mockWalletRepository=MockWalletRepository();
    addMoneyToWalletUsecase=AddMoneyToWalletUsecase(mockWalletRepository);
  });
  BalanceEntity balanceEntity=BalanceEntity(
    code: 'code'
  );

  test('should send and get from repo successfully', ()async{
    when(mockWalletRepository.addMoneyToWallet(balanceEntity)).thenAnswer((_)async{
      return Right(true);
    });
    final res=await addMoneyToWalletUsecase.call(balanceEntity);
    expect(res, Right(true));
  });
}