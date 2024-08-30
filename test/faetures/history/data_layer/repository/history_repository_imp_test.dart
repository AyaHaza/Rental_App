import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/core/error/exception.dart';
import 'package:rental_clean_tdd/core/error/failure.dart';
import 'package:rental_clean_tdd/features/history/data_layer/repository/history_repository_imp.dart';
import 'package:rental_clean_tdd/features/history/domain_layer/entities/history_entity.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late MockHistoryApiService mockHistoryApiService;
    late HistoryRepositoryImp historyRepositoryImp;

  setUp((){
    mockHistoryApiService=MockHistoryApiService();
    historyRepositoryImp=HistoryRepositoryImp(mockHistoryApiService);
  });


  HistoryEntity historyEntity=HistoryEntity(statrPoint: 'statrPoint', destinationPoint: 'destinationPoint');
  List<HistoryEntity> historyEntityList=[HistoryEntity(statrPoint: 'statrPoint', destinationPoint: 'destinationPoint')];


  group('add History supa', (){
    test("success API", ()async{
      when(mockHistoryApiService.addToHistorySupa(historyEntity)).thenAnswer((_)async=>true);
      final res=await historyRepositoryImp.addToHistorySupa(historyEntity);
      expect(res, Right(true));
    });

    test('failure API so return server fauilare', ()async{
      when(mockHistoryApiService.addToHistorySupa(historyEntity)).thenThrow(ServerException("An error has occurred"));
      final res=await historyRepositoryImp.addToHistorySupa(historyEntity);
      expect(res, Left(ServerFailure("An error has occurred")));
    });

    test('no internet so return connection fauilare', ()async{
      when(mockHistoryApiService.addToHistorySupa(historyEntity)).thenThrow(SocketException("Failed to connect to the network"));
      final res=await historyRepositoryImp.addToHistorySupa(historyEntity);
      expect(res, Left(ConnectionFailure("Failed to connect to the network")));
    });
  });

  group('delete History supa', (){
    test("success API", ()async{
      when(mockHistoryApiService.deleteHistorySupa(1)).thenAnswer((_)async=>true);
      final res=await historyRepositoryImp.deleteHistorySupa(1);
      expect(res, Right(true));
    });

    test('failure API so return server fauilare', ()async{
      when(mockHistoryApiService.deleteHistorySupa(1)).thenThrow(ServerException("An error has occurred"));
      final res=await historyRepositoryImp.deleteHistorySupa(1);
      expect(res, Left(ServerFailure("An error has occurred")));
    });

    test('no internet so return connection fauilare', ()async{
      when(mockHistoryApiService.deleteHistorySupa(1)).thenThrow(SocketException("Failed to connect to the network"));
      final res=await historyRepositoryImp.deleteHistorySupa(1);
      expect(res, Left(ConnectionFailure("Failed to connect to the network")));
    });
  });

  group('get History supa', (){
    test("success API", ()async{
      when(mockHistoryApiService.getHistorySupa()).thenAnswer((_)async=>historyEntityList);
      final res=await historyRepositoryImp.getHistorySupa();
      expect(res, Right(historyEntityList));
    });

    test('failure API so return server fauilare', ()async{
      when(mockHistoryApiService.getHistorySupa()).thenThrow(ServerException("An error has occurred"));
      final res=await historyRepositoryImp.getHistorySupa();
      expect(res, Left(ServerFailure("An error has occurred")));
    });

    test('no internet so return connection fauilare', ()async{
      when(mockHistoryApiService.getHistorySupa()).thenThrow(SocketException("Failed to connect to the network"));
      final res=await historyRepositoryImp.getHistorySupa();
      expect(res, Left(ConnectionFailure("Failed to connect to the network")));
    });
  });
}