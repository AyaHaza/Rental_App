import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/features/authentication/domain_layer/usecases/register_with_gamil_usecase.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late RegisterWithGamilUsecase registerWithGamilUsecase;
  late MockAuthenticationRepository mockAuthenticationRepository;
  setUp((){
    mockAuthenticationRepository=MockAuthenticationRepository();
    registerWithGamilUsecase=RegisterWithGamilUsecase(mockAuthenticationRepository);
  });

  test('should send and get from repo successfully', ()async{
    when(mockAuthenticationRepository.registerWithGamil()).thenAnswer((_)async{
      return Right(true);
    });
    final res=await registerWithGamilUsecase.call('string');
    expect(res, Right(true));
  });
}