import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/features/authentication/domain_layer/entities/user_regiser_entity.dart';
import 'package:rental_clean_tdd/features/authentication/domain_layer/usecases/edit_profile_supa_usecase.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late EditProfileSupaUsecase editProfileSupaUsecase;
  late MockAuthenticationRepository mockAuthenticationRepository;
  setUp((){
    mockAuthenticationRepository=MockAuthenticationRepository();
    editProfileSupaUsecase=EditProfileSupaUsecase(mockAuthenticationRepository);
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
    when(mockAuthenticationRepository.editprofileSupa(userRegisterEntity)).thenAnswer((_)async{
      return Right(true);
    });
    final res=await editProfileSupaUsecase.call(userRegisterEntity);
    expect(res, Right(true));
  });
}