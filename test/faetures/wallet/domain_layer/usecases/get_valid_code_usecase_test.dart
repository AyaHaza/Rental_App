import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/features/wallet/domain_layer/entities/wallet_valid_code_entity.dart';
import 'package:rental_clean_tdd/features/wallet/domain_layer/usecases/get_valid_code_usecase.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late GetValidCodeUsecase getValidCodeUsecase;
  late MockWalletRepository mockWalletRepository;
  setUp((){
    mockWalletRepository=MockWalletRepository();
    getValidCodeUsecase=GetValidCodeUsecase(mockWalletRepository);
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

  test('should send and get from repo successfully', ()async{
    when(mockWalletRepository.getValidCode()).thenAnswer((_)async{
      return Right(walletEntity);
    });
    final res=await getValidCodeUsecase.call('get');
    expect(res, Right(walletEntity));
  });
}