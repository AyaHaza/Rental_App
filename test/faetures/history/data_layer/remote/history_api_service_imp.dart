import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:rental_clean_tdd/core/resources/variable.dart';
import 'package:rental_clean_tdd/features/history/data_layer/data_source/remote/history_api_service_imp.dart';
import 'package:rental_clean_tdd/features/history/data_layer/models/history_model.dart';
import 'package:rental_clean_tdd/features/history/domain_layer/entities/history_entity.dart';

void main(){
  late Dio mockDio;
  late DioAdapter dioAdapter;
  late HistoryApiServiceImp historyApiServiceImp;

  setUp((){
    mockDio=Dio();
    dioAdapter = DioAdapter(
      dio: mockDio,
      matcher: const FullHttpRequestMatcher(),
    );
    historyApiServiceImp =HistoryApiServiceImp(mockDio);
  });

  final headers = <String, dynamic>{
    'accept':'*/*',
    'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMjIyODg3NzkxIiwiaWF0IjoxNzI0ODczODIxLCJleHAiOjE3MjQ5NjAyMjF9'
  };

  final headersSupa = <String, dynamic>{
    'apiKey': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5sdWx2anR6ZXdraHBzaXN0dWhmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjQzMzY5MjAsImV4cCI6MjAzOTkxMjkyMH0.TsmIoIUBH3AQMC4cllXe0lBNJydLGH6xVwfM47OAq_Q'
  };

  HistoryEntity historyEntity= HistoryEntity(statrPoint: 'statrPoint', destinationPoint: 'destinationPoint');
  final  _datahistoryEntity = jsonEncode(HistoryModel.fromEntity(historyEntity));

  group('add history supa', (){
    test("the response code is 200", ()async{
      dioAdapter.onPost(apiTableHistory, (server) => server.reply(200,true),
          data: _datahistoryEntity,
          headers: headersSupa
      );
      final res=await historyApiServiceImp.addToHistorySupa(historyEntity);
      expect(res, true);
    });

    test("the response code is 400", ()async{
      dioAdapter.onPost(apiTableHistory, (server) => server.throws(
        400,
        DioException(
          requestOptions: RequestOptions(
            path: apiTableHistory,
          ),
        ),
      ),
          data: _datahistoryEntity,
          headers: headersSupa
      );
      final res=()async=>await historyApiServiceImp.addToHistorySupa(historyEntity);
      expect(res,throwsA(isA<SocketException>()));
    });
  });

  group('delete history supa', (){
    test("the response code is 200", ()async{
      dioAdapter.onDelete('${apiTableHistory}?id=eq.1', (server) => server.reply(200,true),
          headers: headersSupa
      );
      final res=await historyApiServiceImp.deleteHistorySupa(1);
      expect(res, true);
    });

    test(" the response code is 400", ()async{
      dioAdapter.onDelete('${apiTableHistory}?id=eq.1', (server) => server.throws(
        400,
        DioException(
          requestOptions: RequestOptions(
            path: '${apiTableHistory}?id=eq.1',
          ),
        ),
      ),
          headers: headersSupa
      );
      final res=()async=>await historyApiServiceImp.deleteHistorySupa(1);
      expect(res,throwsA(isA<SocketException>()));
    });
  });

  group('get history supa', (){
    test(" the response code is 200", ()async{
      dioAdapter.onGet('${apiTableHistory}?select=*', (server) => server.reply(200,[{
        'statrPoint': 'statrPoint', 'destinationPoint': 'destinationPoint'
      }]),
          headers: headersSupa
      );
      final res=await historyApiServiceImp.getHistorySupa();
      expect(res, isA<List<HistoryModel>>());
    });

    test(" the response code is 400", ()async{
      dioAdapter.onGet('${apiTableHistory}?select=*', (server) => server.throws(
        400,
        DioException(
          requestOptions: RequestOptions(
            path: '${apiTableHistory}?select=*',
          ),
        ),
      ),
          headers: headersSupa
      );
      final res=()async=>await historyApiServiceImp.getHistorySupa();
      expect(res,throwsA(isA<SocketException>()));
    });
  });

}