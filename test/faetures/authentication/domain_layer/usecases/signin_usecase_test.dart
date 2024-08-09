import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/features/authentication/domain_layer/entities/user_login_entity.dart';
import 'package:rental_clean_tdd/features/authentication/domain_layer/usecases/signin_usecase.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late SignInUseCase signInUseCase;
  late MockAuthenticationRepository mockAuthenticationRepository;
  setUp((){
    mockAuthenticationRepository=MockAuthenticationRepository();
    signInUseCase=SignInUseCase(mockAuthenticationRepository);
  });
  UserLoginEntity userLoginEntity=UserLoginEntity(
      phone: '4790112833',
      password: 'aassqQQ12!!',
  );

  test('should send user to repo', ()async{
    when(mockAuthenticationRepository.signIn(userLoginEntity)).thenAnswer((_)async{
      return Right(true);
    });
    final res=await signInUseCase.call(userLoginEntity);
    expect(res, Right(true));
  });
}