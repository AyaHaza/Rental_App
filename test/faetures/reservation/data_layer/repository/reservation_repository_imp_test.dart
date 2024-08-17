import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/core/error/exception.dart';
import 'package:rental_clean_tdd/core/error/failure.dart';
import 'package:rental_clean_tdd/features/reservation/data_layer/repository/reservation_repository_imp.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/entities/bicycle_by_category_entity.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/entities/bicycle_category_entity.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/entities/bicycle_details_entity.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/entities/hub_content_entity.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/entities/photo_entity.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late MockReservationApiService mockReservationApiService;
  late ReservationRepositoryImp reservationRepositoryImp;

  setUp((){
    mockReservationApiService=MockReservationApiService();
    reservationRepositoryImp=ReservationRepositoryImp(mockReservationApiService);
  });

  BicycleCategoryEntity bicycleCategoryEntity =BicycleCategoryEntity(
      message: "Get all categories",
      status: "ACCEPTED",
      localDateTime: DateTime(2000,12,1,19,26,50,2345),
      body:['Road_bikes', 'Mountain_bikes', 'Hybrid_bikes', 'E_bikes']
  );
  group('get bicycle categorey', (){
    test('success API', ()async{
      when(mockReservationApiService.getBicycleCategory()).thenAnswer((_)async=>bicycleCategoryEntity);
      final res=await reservationRepositoryImp.getBicycleCategory();
      expect(res, Right(bicycleCategoryEntity));
    });
    test('failure API so return server fauilare', ()async{
      when(mockReservationApiService.getBicycleCategory()).thenThrow(ServerException("An error has occurred"));
      final res=await reservationRepositoryImp.getBicycleCategory();
      expect(res, Left(ServerFailure("An error has occurred")));
    });

    test('no internet so return connection fauilare', ()async{
      when(mockReservationApiService.getBicycleCategory()).thenThrow(SocketException("Failed to connect to the network"));
      final res=await reservationRepositoryImp.getBicycleCategory();
      expect(res, Left(ConnectionFailure("Failed to connect to the network")));
    });
  });

  BicycleByCategoryEntity bicycleByCategoryEntity=BicycleByCategoryEntity(
      message: "Get all categories",
      status: "ACCEPTED",
      localDateTime: DateTime(2000,12,1,19,26,50,2345),
      body:null
  );
  group('get bicycle by categorey', (){
    test('success API', ()async{
      when(mockReservationApiService.getBicycleByCategory("Road_bikes")).thenAnswer((_)async=>bicycleByCategoryEntity);
      final res=await reservationRepositoryImp.getBicycleByCategory("Road_bikes");
      expect(res, Right(bicycleByCategoryEntity));
    });
    test('failure API so return server fauilare', ()async{
      when(mockReservationApiService.getBicycleByCategory("Road_bikes")).thenThrow(ServerException("An error has occurred"));
      final res=await reservationRepositoryImp.getBicycleByCategory("Road_bikes");
      expect(res, Left(ServerFailure("An error has occurred")));
    });

    test('no internet so return connection fauilare', ()async{
      when(mockReservationApiService.getBicycleByCategory("Road_bikes")).thenThrow(SocketException("Failed to connect to the network"));
      final res=await reservationRepositoryImp.getBicycleByCategory("Road_bikes");
      expect(res, Left(ConnectionFailure("Failed to connect to the network")));
    });
  });

  HubContentEntity hubContentEntity=HubContentEntity(
      message: "Get all categories",
      status: "ACCEPTED",
      localDateTime: DateTime(2000,12,1,19,26,50,2345),
      body: null
  );
  group('get hub content', (){
    test('success API', ()async{
      when(mockReservationApiService.getHubContent("category", 1)).thenAnswer((_)async=>hubContentEntity);
      final res=await reservationRepositoryImp.getHubContent("category", 1);
      expect(res, Right(hubContentEntity));
    });
    test('failure API so return server fauilare', ()async{
      when(mockReservationApiService.getHubContent("category", 1)).thenThrow(ServerException("An error has occurred"));
      final res=await reservationRepositoryImp.getHubContent("category", 1);
      expect(res, Left(ServerFailure("An error has occurred")));
    });

    test('no internet so return connection fauilare', ()async{
      when(mockReservationApiService.getHubContent("category", 1)).thenThrow(SocketException("Failed to connect to the network"));
      final res=await reservationRepositoryImp.getHubContent("category", 1);
      expect(res, Left(ConnectionFailure("Failed to connect to the network")));
    });
  });

  PhotoEntity photoEntity=PhotoEntity(
      message: "Get all categories",
      status: "ACCEPTED",
      localDateTime: DateTime(2000,12,1,19,26,50,2345),
      body: null
  );
  group('get photos', (){
    test('success API', ()async{
      when(mockReservationApiService.getPhotos()).thenAnswer((_)async=>photoEntity);
      final res=await reservationRepositoryImp.getPhotos();
      expect(res, Right(photoEntity));
    });
    test('failure API so return server fauilare', ()async{
      when(mockReservationApiService.getPhotos()).thenThrow(ServerException("An error has occurred"));
      final res=await reservationRepositoryImp.getPhotos();
      expect(res, Left(ServerFailure("An error has occurred")));
    });

    test('no internet so return connection fauilare', ()async{
      when(mockReservationApiService.getPhotos()).thenThrow(SocketException("Failed to connect to the network"));
      final res=await reservationRepositoryImp.getPhotos();
      expect(res, Left(ConnectionFailure("Failed to connect to the network")));
    });
  });

  BicycleDetailsEntity bicycleDetailsEntity=BicycleDetailsEntity(
      message: "Get all categories",
      status: "ACCEPTED",
      localDateTime: DateTime(2000,12,1,19,26,50,2345),
      body: null
  );
  group('get bicycle details', (){
    test('success API', ()async{
      when(mockReservationApiService.getdetails(1)).thenAnswer((_)async=>bicycleDetailsEntity);
      final res=await reservationRepositoryImp.getdetails(1);
      expect(res, Right(bicycleDetailsEntity));
    });
    test('failure API so return server fauilare', ()async{
      when(mockReservationApiService.getdetails(1)).thenThrow(ServerException("An error has occurred"));
      final res=await reservationRepositoryImp.getdetails(1);
      expect(res, Left(ServerFailure("An error has occurred")));
    });

    test('no internet so return connection fauilare', ()async{
      when(mockReservationApiService.getdetails(1)).thenThrow(SocketException("Failed to connect to the network"));
      final res=await reservationRepositoryImp.getdetails(1);
      expect(res, Left(ConnectionFailure("Failed to connect to the network")));
    });
  });
}