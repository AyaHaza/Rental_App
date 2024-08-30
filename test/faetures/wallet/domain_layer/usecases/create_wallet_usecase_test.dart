import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/features/wallet/domain_layer/entities/wallet_entity.dart';
import 'package:rental_clean_tdd/features/wallet/domain_layer/usecases/create_wallet_usecase.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late CreateWalletUsecase createWalletUsecase;
  late MockWalletRepository mockWalletRepository;
  setUp((){
    mockWalletRepository=MockWalletRepository();
    createWalletUsecase=CreateWalletUsecase(mockWalletRepository);
  });
  WalletEntity walletEntity=WalletEntity(
    securityCode: 'securityCode',
    confirmSecurityCode: 'confirmSecurityCode',
    bankAccount: 'bankAccount'
  );

  test('should send and get from repo successfully', ()async{
    when(mockWalletRepository.createWallet(walletEntity)).thenAnswer((_)async{
      return Right(true);
    });
    final res=await createWalletUsecase.call(walletEntity);
    expect(res, Right(true));
  });
}