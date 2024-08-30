import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/features/authentication/domain_layer/entities/user_regiser_entity.dart';
import 'package:rental_clean_tdd/features/authentication/domain_layer/usecases/get_profile_supa_usecase.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late GetProfileSupaUsecase getProfileSupaUsecase;
  late MockAuthenticationRepository mockAuthenticationRepository;
  setUp((){
    mockAuthenticationRepository=MockAuthenticationRepository();
    getProfileSupaUsecase=GetProfileSupaUsecase(mockAuthenticationRepository);
  });

  UserRegisterEntity userRegisterEntity=UserRegisterEntity(
      firstName: 'hala',
      lastName: 'sadah',
      phone: '4790112833',
      birthDate: DateTime(2000,12,1),
      username: 'cscwvvw',
      password: 'aassqQQ12!!',
      confirmPassword: 'aassqQQ12!!'
  );

  test('should send and get from repo successfully', ()async{
    when(mockAuthenticationRepository.getprofileSupa("cscwvvw")).thenAnswer((_)async{
      return Right(userRegisterEntity);
    });
    final res=await getProfileSupaUsecase.call('cscwvvw');
    expect(res, Right(userRegisterEntity));
  });
}