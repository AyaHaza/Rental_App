import 'package:flutter_test/flutter_test.dart';
import 'package:rental_clean_tdd/features/authentication/data_layer/models/user_register_model.dart';
import 'package:rental_clean_tdd/features/authentication/domain_layer/entities/user_regiser_entity.dart';

void main(){
  UserRegisterModel userRegisterModel=UserRegisterModel(
      firstName: 'hala',
      lastName: 'sadah',
      phone: '4790112833',
      birthDate: DateTime(2000,12,1),
      username: 'cscwvvw',
      password: 'aassqQQ12!!',
      confirmPassword: 'aassqQQ12!!'
  );

  test("UserRegisterModel is subclass of UserRegisterEntity", ()async{
    expect(userRegisterModel, isA<UserRegisterEntity>());
  });

  test("return a json map", ()async{
    final res=userRegisterModel.toJson();
    final expextedJsonMap={
      'firstName': 'hala',
      'lastName': 'sadah',
      'phone': '4790112833',
      'birthDate': '2000-12-01',
      'username': 'cscwvvw',
      'password': 'aassqQQ12!!',
      'confirmPassword': 'aassqQQ12!!'
    };
    expect(res, expextedJsonMap);
  });

}