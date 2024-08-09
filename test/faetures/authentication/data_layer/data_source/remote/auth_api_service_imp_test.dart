import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rental_clean_tdd/core/error/exception.dart';
import 'package:rental_clean_tdd/features/authentication/data_layer/data_source/remote/auth_api_service_imp.dart';
import 'package:rental_clean_tdd/features/authentication/data_layer/models/user_login_model.dart';
import 'package:rental_clean_tdd/features/authentication/data_layer/models/user_register_model.dart';


void main(){
  late AuthApiServiceImp authApiServiceImp;
  setUp((){
    authApiServiceImp =AuthApiServiceImp();
  });

  UserRegisterModel userRegisterModelvaild=UserRegisterModel(
      firstName: 'hala',
      lastName: 'sadah',
      phone: '4710114493',
      birthDate: DateTime(2000,12,1),
      username: 'rdcswvvw',
      password: 'aassqQQ12!!',
      confirmPassword: 'aassqQQ12!!'
  );
  UserRegisterModel userRegisterModelNotVaild=UserRegisterModel(
      firstName: 'hala',
      lastName: 'sadah',
      phone: '4790116623',
      birthDate: DateTime(2000,12,1),
      username: 'cscrdcqwvvw',
      password: 'aassqQQ12!!',
      confirmPassword: 'aassqQQ12!!'
  );

  UserLoginModel userLoginModelvaild=UserLoginModel(
      phone: '4710116623',
      password: 'aassqQQ12!!',
  );
  UserLoginModel userLoginModelNotVaild=UserLoginModel(
      phone: '4790116621',
      password: 'aassqQQ12!!',
  );
  
  group("signUp", (){
    test("return true when the response code is 200", ()async{
      final res=await authApiServiceImp.signup(userRegisterModelvaild);
      expect(res, Right(true));
    });

    test("return server exception when the response code is 400", ()async{
      final res=()async=>await authApiServiceImp.signup(userRegisterModelNotVaild);
      expect(res, throwsA(isA<ServerException>()));
    });
  });

  group("signIn", (){
    test("return true when the response code is 200", ()async{
      final res=await authApiServiceImp.signin(userLoginModelvaild);
      expect(res, Right(true));
    });

    test("return server exception when the response code is 400", ()async{
      final res=()async=>await authApiServiceImp.signin(userLoginModelNotVaild);
      expect(res, throwsA(isA<ServerException>()));
    });
  });
}