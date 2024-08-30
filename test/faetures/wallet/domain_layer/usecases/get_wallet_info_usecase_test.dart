import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/features/wallet/domain_layer/entities/wallet_info_entity.dart';
import 'package:rental_clean_tdd/features/wallet/domain_layer/usecases/get_wallet_info_usecase.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late GetWalletInfoUsecase getWalletInfoUsecase;
  late MockWalletRepository mockWalletRepository;
  setUp((){
    mockWalletRepository=MockWalletRepository();
    getWalletInfoUsecase=GetWalletInfoUsecase(mockWalletRepository);
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

  test('should send and get from repo successfully', ()async{
    when(mockWalletRepository.getWalletInfo()).thenAnswer((_)async{
      return Right(walletEntity);
    });
    final res=await getWalletInfoUsecase.call('get');
    expect(res, Right(walletEntity));
  });
}