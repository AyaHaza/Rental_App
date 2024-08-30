import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:rental_clean_tdd/core/resources/variable.dart';
import 'package:rental_clean_tdd/features/authentication/data_layer/data_source/remote/auth_api_service_imp.dart';
import 'package:rental_clean_tdd/features/authentication/data_layer/models/user_login_model.dart';
import 'package:rental_clean_tdd/features/authentication/data_layer/models/user_register_model.dart';
import 'package:rental_clean_tdd/features/authentication/domain_layer/entities/user_login_entity.dart';
import 'package:rental_clean_tdd/features/authentication/domain_layer/entities/user_regiser_entity.dart';

void main(){
  late Dio mockDio;
  late DioAdapter dioAdapter;
  late AuthApiServiceImp authApiServiceImp;
  setUp((){
    mockDio=Dio();
    dioAdapter = DioAdapter(
        dio: mockDio,
        matcher: const FullHttpRequestMatcher(),
    );
    authApiServiceImp =AuthApiServiceImp(mockDio);
  });

  final headers = <String, dynamic>{
    'apiKey': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5sdWx2anR6ZXdraHBzaXN0dWhmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjQzMzY5MjAsImV4cCI6MjAzOTkxMjkyMH0.TsmIoIUBH3AQMC4cllXe0lBNJydLGH6xVwfM47OAq_Q'
  };
  UserRegisterEntity userRegisterEntity=UserRegisterEntity(
      firstName: 'hala',
      lastName: 'sadah',
      phone: '4710114113',
      birthDate: DateTime(2000,12,1),
      username: 'asqqqqwf3fwq',
      password: 'aassqQQ12!!',
      confirmPassword: 'aassqQQ12!!'
  );
  final  _dataRegister = jsonEncode(UserRegisterModel.fromJson(userRegisterEntity));

  UserLoginEntity userLoginEntity=UserLoginEntity(
      phone: '4710116623',
      password: 'aassqQQ12!!',
  );
  final _dataLogin = jsonEncode(UserLoginModel.fromJson(userLoginEntity));

  group("signUp", (){
    test("return true when the response code is 200", ()async{
      dioAdapter.onPost(
        baseUrl+registerApi, (server) => server.reply(200,true),
        data: _dataRegister,
      );
      final res=await authApiServiceImp.signup(userRegisterEntity);
      expect(res, true);
    });

    test("return dio exception when the response code is 400", ()async{
      dioAdapter.onPost(
        baseUrl+registerApi, (server) => server.throws(
        400,
        DioException(
          requestOptions: RequestOptions(
            path: baseUrl+registerApi,
          ),
        ),
      ),
        data: _dataRegister,
      );
      final res=()async=>await authApiServiceImp.signup(userRegisterEntity);
      expect(res,throwsA(isA<DioException>()));
    });
  });

  group("signIn", (){
    test("return true when the response code is 200", ()async{
      dioAdapter.onPost(
        baseUrl+loginApi, (server) => server.reply(200,true),
        data: _dataLogin,
      );
      final res=await authApiServiceImp.signin(userLoginEntity);
      expect(res, true);
    });

    test("return dio exception when the response code is 400", ()async{
      dioAdapter.onPost(
        baseUrl+loginApi, (server) => server.throws(
        400,
        DioException(
          requestOptions: RequestOptions(
            path: baseUrl+loginApi,
          ),
        ),
      ),
        data: _dataLogin,
      );
      final res=()async=>await authApiServiceImp.signin(userLoginEntity);
      expect(res,throwsA(isA<DioException>()));
    });
  });

  group("add profile supa", (){
    test("return true when the response code is 201", ()async{
      dioAdapter.onPost(
        apiTableProfile, (server) => server.reply(201,true),
        data: _dataRegister,
          headers:headers
      );
      final res=await authApiServiceImp.addprofileSupa(userRegisterEntity);
      expect(res, true);
    });

    test("return dio exception when the response code is 400", ()async{
      dioAdapter.onPost(
        apiTableProfile, (server) => server.throws(
        400,
        DioException(
          requestOptions: RequestOptions(
            path: apiTableProfile,
          ),
        ),
      ),
          data: _dataRegister,
          headers:headers
      );
      final res=()async=>await authApiServiceImp.addprofileSupa(userRegisterEntity);
      expect(res,throwsA(isA<SocketException>()));
    });
  });

  group("edit profile supa", (){
    test("return true when the response code is 201", ()async{
      dioAdapter.onPatch(
        '${apiTableProfile}?username=eq.asqqqqwf3fwq', (server) => server.reply(201,true),
        data: _dataRegister,
          headers:headers
      );
      final res=await authApiServiceImp.editprofileSupa(userRegisterEntity);
      expect(res, true);
    });

    test("return dio exception when the response code is 400", ()async{
      dioAdapter.onPatch(
        '${apiTableProfile}?username=eq.asqqqqwf3fwq', (server) => server.throws(
        400,
        DioException(
          requestOptions: RequestOptions(
            path: '${apiTableProfile}?username=eq.asqqqqwf3fwq',
          ),
        ),
      ),
          data: _dataRegister,
          headers:headers
      );
      final res=()async=>await authApiServiceImp.editprofileSupa(userRegisterEntity);
      expect(res,throwsA(isA<SocketException>()));
    });
  });

  group("get profile supa", (){
    test("return true when the response code is 200", ()async{
      dioAdapter.onGet(
        '${apiTableProfile}?username=eq.asqqqqwf3fwq', (server) => server.reply(200,
          [{
            'firstName':'hala',
            'lastName':'sadah',
            'phone':'4710114113',
            'username':'asqqqqwf3fwq',
            'birthDate': '2024-08-14',
            'password': 'aassqQQ12!!',
            'confirmPassword': 'aassqQQ12!!'
          }],
          ),headers:headers
      );
      final res=await authApiServiceImp.getprofileSupa('asqqqqwf3fwq');
      expect(res, isA<UserRegisterModel>());
    });

    test("return dio exception when the response code is 400", ()async{
      dioAdapter.onGet(
        '${apiTableProfile}?username=eq.asqqqqwf3fwq', (server) => server.throws(
        400,
        DioException(
          requestOptions: RequestOptions(
            path: '${apiTableProfile}?username=eq.asqqqqwf3fwq',
          ),
        ),
      ),
      );
      final res=()async=>await authApiServiceImp.getprofileSupa('asqqqqwf3fwq');
      expect(res,throwsA(isA<SocketException>()));
    });
  });

}