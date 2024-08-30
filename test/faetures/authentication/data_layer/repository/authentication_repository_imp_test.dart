import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/core/error/exception.dart';
import 'package:rental_clean_tdd/core/error/failure.dart';
import 'package:rental_clean_tdd/features/authentication/data_layer/repository/authentication_repository_imp.dart';
import 'package:rental_clean_tdd/features/authentication/domain_layer/entities/user_login_entity.dart';
import 'package:rental_clean_tdd/features/authentication/domain_layer/entities/user_regiser_entity.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late MockAuthApiService mockAuthApiService;
  late AuthenticationRepositoryImp authenticationRepositoryImp;

  setUp((){
    mockAuthApiService=MockAuthApiService();
    authenticationRepositoryImp=AuthenticationRepositoryImp(mockAuthApiService);
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
  UserLoginEntity userLoginEntity=UserLoginEntity(
    phone: '4790112833',
    password: 'aassqQQ12!!',
  );

  group("signUp", (){
    test("success API ", ()async{
      when(mockAuthApiService.signup(userRegisterEntity)).thenAnswer((_)async{
        return true;
      });
      final res=await authenticationRepositoryImp.signUp(userRegisterEntity);
      expect(res, Right(true));
    });
    
    test("failure API so return server fauilare", ()async{
      when(mockAuthApiService.signup(userRegisterEntity)).thenThrow(ServerException('An error has occurred'));
      final res=await authenticationRepositoryImp.signUp(userRegisterEntity);
      expect(res, Left(ServerFailure('An error has occurred')));
    });

    test('no internet so return connection fauilare', ()async{
      when(mockAuthApiService.signup(userRegisterEntity)).thenThrow(SocketException("Failed to connect to the network"));
      final res=await authenticationRepositoryImp.signUp(userRegisterEntity);
      expect(res, Left(ConnectionFailure("Failed to connect to the network")));
    });
  });

  group("signIn", (){
    test("success API ", ()async{
      when(mockAuthApiService.signin(userLoginEntity)).thenAnswer((_)async{
        return true;
      });
      final res=await authenticationRepositoryImp.signIn(userLoginEntity);
      expect(res, Right(true));
    });

    test("failure API so return server fauilare", ()async{
      when(mockAuthApiService.signin(userLoginEntity)).thenThrow(ServerException('An error has occurred'));
      final res=await authenticationRepositoryImp.signIn(userLoginEntity);
      expect(res, Left(ServerFailure('An error has occurred')));
    });

    test('no internet so return connection fauilare', ()async{
      when(mockAuthApiService.signin(userLoginEntity)).thenThrow(SocketException("Failed to connect to the network"));
      final res=await authenticationRepositoryImp.signIn(userLoginEntity);
      expect(res, Left(ConnectionFailure("Failed to connect to the network")));
    });
  });


  group("register with gmail", (){
    test("success API ", ()async{
      when(mockAuthApiService.registerWithGamil()).thenAnswer((_)async{
        return true;
      });
      final res=await authenticationRepositoryImp.registerWithGamil();
      expect(res, Right(true));
    });

    test('no internet so return connection fauilare', ()async{
      when(mockAuthApiService.registerWithGamil()).thenThrow(SocketException("Failed to connect to the network"));
      final res=await authenticationRepositoryImp.registerWithGamil();
      expect(res, Left(ConnectionFailure("Failed to connect to the network")));
    });
  });

  group("add profile supa", (){
    test("success API ", ()async{
      when(mockAuthApiService.addprofileSupa(userRegisterEntity)).thenAnswer((_)async{
        return true;
      });
      final res=await authenticationRepositoryImp.addprofileSupa(userRegisterEntity);
      expect(res, Right(true));
    });

    test("failure API so return server fauilare", ()async{
      when(mockAuthApiService.addprofileSupa(userRegisterEntity)).thenThrow(ServerException('An error has occurred'));
      final res=await authenticationRepositoryImp.addprofileSupa(userRegisterEntity);
      expect(res, Left(ServerFailure('An error has occurred')));
    });

    test('no internet so return connection fauilare', ()async{
      when(mockAuthApiService.addprofileSupa(userRegisterEntity)).thenThrow(SocketException("Failed to connect to the network"));
      final res=await authenticationRepositoryImp.addprofileSupa(userRegisterEntity);
      expect(res, Left(ConnectionFailure("Failed to connect to the network")));
    });
  });

  group("edit profile supa", (){
    test("success API ", ()async{
      when(mockAuthApiService.editprofileSupa(userRegisterEntity)).thenAnswer((_)async{
        return true;
      });
      final res=await authenticationRepositoryImp.editprofileSupa(userRegisterEntity);
      expect(res, Right(true));
    });

    test("failure API so return server fauilare", ()async{
      when(mockAuthApiService.editprofileSupa(userRegisterEntity)).thenThrow(ServerException('An error has occurred'));
      final res=await authenticationRepositoryImp.editprofileSupa(userRegisterEntity);
      expect(res, Left(ServerFailure('An error has occurred')));
    });

    test('no internet so return connection fauilare', ()async{
      when(mockAuthApiService.editprofileSupa(userRegisterEntity)).thenThrow(SocketException("Failed to connect to the network"));
      final res=await authenticationRepositoryImp.editprofileSupa(userRegisterEntity);
      expect(res, Left(ConnectionFailure("Failed to connect to the network")));
    });
  });


  group("get profile supa", (){
    test("success API ", ()async{
      when(mockAuthApiService.getprofileSupa('hala123096')).thenAnswer((_)async{
        return userRegisterEntity;
      });
      final res=await authenticationRepositoryImp.getprofileSupa('hala123096');
      expect(res, Right(userRegisterEntity));
    });

    test("failure API so return server fauilare", ()async{
      when(mockAuthApiService.getprofileSupa('hala123096')).thenThrow(ServerException('An error has occurred'));
      final res=await authenticationRepositoryImp.getprofileSupa('hala123096');
      expect(res, Left(ServerFailure('An error has occurred')));
    });

    test('no internet so return connection fauilare', ()async{
      when(mockAuthApiService.getprofileSupa('hala123096')).thenThrow(SocketException("Failed to connect to the network"));
      final res=await authenticationRepositoryImp.getprofileSupa('hala123096');
      expect(res, Left(ConnectionFailure("Failed to connect to the network")));
    });
  });




}