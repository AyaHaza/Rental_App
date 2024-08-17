import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:location/location.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/core/error/exception.dart';
import 'package:rental_clean_tdd/core/error/failure.dart';
import 'package:rental_clean_tdd/features/map/data_layer/repository/map_repository_imp.dart';
import 'package:rental_clean_tdd/features/map/domain_layer/entities/hubs_entity.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late LocationData locationData;
  late MockMapApiService mockMapApiService;
  late MapRepositoryImp mapRepositoryImp;

  setUp((){
    locationData=LocationData.fromMap({});
    mockMapApiService=MockMapApiService();
    mapRepositoryImp=MapRepositoryImp(mockMapApiService);
  });

  List<HubsEntity> hubsEntity =[HubsEntity(
      id: 1,
      name: 'nmae',
      description:'description' ,
      latitude: 1.1,
      longitude:1.1
  )];

  group('get Location', (){
    test("success API", ()async{
      when(mockMapApiService.getCurrentLocation()).thenAnswer((_)async=>locationData);
      final res=await mapRepositoryImp.getCurrentLocation();
      expect(res, Right(locationData));
    });

    test('failure API so return server fauilare', ()async{
      when(mockMapApiService.getCurrentLocation()).thenThrow(DioException(requestOptions: RequestOptions()));
      final res=await mapRepositoryImp.getCurrentLocation();
      expect(res, Left(ServerFailure("An error has occurred")));
    });
  });

  group('get Hubs', (){
    test("success API", ()async{
      when(mockMapApiService.getHubs(locationData)).thenAnswer((_)async=>hubsEntity);
      final res=await mapRepositoryImp.getHubs(locationData);
      expect(res, Right(hubsEntity));
    });

    test('failure API so return server fauilare', ()async{
      when(mockMapApiService.getHubs(locationData)).thenThrow(ServerException("An error has occurred"));
      final res=await mapRepositoryImp.getHubs(locationData);
      expect(res, Left(ServerFailure("An error has occurred")));
    });

    test('no internet so return connection fauilare', ()async{
      when(mockMapApiService.getHubs(locationData)).thenThrow(SocketException("Failed to connect to the network"));
      final res=await mapRepositoryImp.getHubs(locationData);
      expect(res, Left(ConnectionFailure("Failed to connect to the network")));
    });
  });
}