import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/core/error/exception.dart';
import 'package:rental_clean_tdd/core/error/failure.dart';
import 'package:rental_clean_tdd/features/bicycle_mangement/data_layer/repository/bicycle_repository_imp.dart';
import 'package:rental_clean_tdd/features/bicycle_mangement/domain_layer/entities/bicycle_Supa_entity.dart';
import 'package:rental_clean_tdd/features/bicycle_mangement/domain_layer/entities/bicycle_entity.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late MockBicycleApiService mockBicycleApiService;
  late BicycleRepositoryImp bicycleRepositoryImp;

  setUp((){
    mockBicycleApiService=MockBicycleApiService();
    bicycleRepositoryImp=BicycleRepositoryImp(mockBicycleApiService);
  });

  List<BicycleSupaEntity>  bicycleSupaEntity=[BicycleSupaEntity(
    id: 1,
    photoPath: 'photoPath',
    type: 'type',
    note: 'note',
    size: 1,
    modelName: 'modelName',
    price: 1.1,
  )];

  List<BicycleEntity> bicycleEntity=[BicycleEntity(
      id:1,
      photoPath: 'photoPath',
      type: 'type',
      note: 'note',
      size: 1,
      modelPrice: ModelPriceEntity(
          id:1,
          price: 8.7,
          model: 'model'
      ),
      maintenance:[]
  )];


  group('add bicycle supa', (){
    test("success API", ()async{
      when(mockBicycleApiService.addBicycleSupa(bicycleSupaEntity[0])).thenAnswer((_)async=>true);
      final res=await bicycleRepositoryImp.addBicycleSupa(bicycleSupaEntity[0]);
      expect(res, Right(true));
    });

    test('failure API so return server fauilare', ()async{
      when(mockBicycleApiService.addBicycleSupa(bicycleSupaEntity[0])).thenThrow(ServerException("An error has occurred"));
      final res=await bicycleRepositoryImp.addBicycleSupa(bicycleSupaEntity[0]);
      expect(res, Left(ServerFailure("An error has occurred")));
    });

    test('no internet so return connection fauilare', ()async{
      when(mockBicycleApiService.addBicycleSupa(bicycleSupaEntity[0])).thenThrow(SocketException("Failed to connect to the network"));
      final res=await bicycleRepositoryImp.addBicycleSupa(bicycleSupaEntity[0]);
      expect(res, Left(ConnectionFailure("Failed to connect to the network")));
    });
  });

  group('edit bicycle supa', (){
    test("success API", ()async{
      when(mockBicycleApiService.editBicycleSupa(1,bicycleSupaEntity[0])).thenAnswer((_)async=>true);
      final res=await bicycleRepositoryImp.editBicycleSupa(1,bicycleSupaEntity[0]);
      expect(res, Right(true));
    });

    test('failure API so return server fauilare', ()async{
      when(mockBicycleApiService.editBicycleSupa(1,bicycleSupaEntity[0])).thenThrow(ServerException("An error has occurred"));
      final res=await bicycleRepositoryImp.editBicycleSupa(1,bicycleSupaEntity[0]);
      expect(res, Left(ServerFailure("An error has occurred")));
    });

    test('no internet so return connection fauilare', ()async{
      when(mockBicycleApiService.editBicycleSupa(1,bicycleSupaEntity[0])).thenThrow(SocketException("Failed to connect to the network"));
      final res=await bicycleRepositoryImp.editBicycleSupa(1,bicycleSupaEntity[0]);
      expect(res, Left(ConnectionFailure("Failed to connect to the network")));
    });
  });

  group('delete bicycle supa', (){
    test("success API", ()async{
      when(mockBicycleApiService.deleteBicycleSupa(1)).thenAnswer((_)async=>true);
      final res=await bicycleRepositoryImp.deleteBicycleSupa(1);
      expect(res, Right(true));
    });

    test('failure API so return server fauilare', ()async{
      when(mockBicycleApiService.deleteBicycleSupa(1)).thenThrow(ServerException("An error has occurred"));
      final res=await bicycleRepositoryImp.deleteBicycleSupa(1);
      expect(res, Left(ServerFailure("An error has occurred")));
    });

    test('no internet so return connection fauilare', ()async{
      when(mockBicycleApiService.deleteBicycleSupa(1)).thenThrow(SocketException("Failed to connect to the network"));
      final res=await bicycleRepositoryImp.deleteBicycleSupa(1);
      expect(res, Left(ConnectionFailure("Failed to connect to the network")));
    });
  });

  group('get bicycle supa', (){
    test("success API", ()async{
      when(mockBicycleApiService.getBicylesSupa()).thenAnswer((_)async=>bicycleSupaEntity);
      final res=await bicycleRepositoryImp.getBicylesSupa();
      expect(res, Right(bicycleSupaEntity));
    });

    test('failure API so return server fauilare', ()async{
      when(mockBicycleApiService.getBicylesSupa()).thenThrow(ServerException("An error has occurred"));
      final res=await bicycleRepositoryImp.getBicylesSupa();
      expect(res, Left(ServerFailure("An error has occurred")));
    });

    test('no internet so return connection fauilare', ()async{
      when(mockBicycleApiService.getBicylesSupa()).thenThrow(SocketException("Failed to connect to the network"));
      final res=await bicycleRepositoryImp.getBicylesSupa();
      expect(res, Left(ConnectionFailure("Failed to connect to the network")));
    });
  });

  group('get bicycle', (){
    test("success API", ()async{
      when(mockBicycleApiService.getBicyles()).thenAnswer((_)async=>bicycleEntity);
      final res=await bicycleRepositoryImp.getBicyles();
      expect(res, Right(bicycleEntity));
    });

    test('failure API so return server fauilare', ()async{
      when(mockBicycleApiService.getBicyles()).thenThrow(ServerException("An error has occurred"));
      final res=await bicycleRepositoryImp.getBicyles();
      expect(res, Left(ServerFailure("An error has occurred")));
    });

    test('no internet so return connection fauilare', ()async{
      when(mockBicycleApiService.getBicyles()).thenThrow(SocketException("Failed to connect to the network"));
      final res=await bicycleRepositoryImp.getBicyles();
      expect(res, Left(ConnectionFailure("Failed to connect to the network")));
    });
  });
}