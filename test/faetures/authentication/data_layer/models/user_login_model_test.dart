import 'package:flutter_test/flutter_test.dart';
import 'package:rental_clean_tdd/features/authentication/data_layer/models/user_login_model.dart';
import 'package:rental_clean_tdd/features/authentication/domain_layer/entities/user_login_entity.dart';

void main(){
  UserLoginModel userLoginModel=UserLoginModel(
      phone: '4790112833',
      password: 'aassqQQ12!!',
  );

  test("UserLoginModel is subclass of UserLoginEntity", ()async{
    expect(userLoginModel, isA<UserLoginEntity>());
  });

  test("return a json map", ()async{
    final res=userLoginModel.toJson();
    final expextedJsonMap={
      'phone': '4790112833',
      'password': 'aassqQQ12!!',
    };
    expect(res, expextedJsonMap);
  });

}