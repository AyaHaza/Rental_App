import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:rental_clean_tdd/core/resources/variable.dart';
import 'package:rental_clean_tdd/features/bicycle_mangement/data_layer/data_source/remote/bicycle_api_service_imp.dart';
import 'package:rental_clean_tdd/features/bicycle_mangement/data_layer/models/bicycle_model.dart';
import 'package:rental_clean_tdd/features/bicycle_mangement/data_layer/models/bicycle_supa_model.dart';
import 'package:rental_clean_tdd/features/bicycle_mangement/domain_layer/entities/bicycle_Supa_entity.dart';
import 'package:rental_clean_tdd/features/bicycle_mangement/domain_layer/entities/bicycle_entity.dart';

void main(){
  late Dio mockDio;
  late DioAdapter dioAdapter;
  late BicycleApiServiceImp bicycleApiServiceImp;

  setUp((){
    mockDio=Dio();
    dioAdapter=DioAdapter(dio: mockDio,
      matcher: const FullHttpRequestMatcher(),
    );
    bicycleApiServiceImp=BicycleApiServiceImp(mockDio);
  });
  final headers = <String, dynamic>{
    'accept':'*/*',
    'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMjIyODg3NzkxIiwiaWF0IjoxNzI0ODczODIxLCJleHAiOjE3MjQ5NjAyMjF9'
  };

  final headersSupa = <String, dynamic>{
    'apiKey': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5sdWx2anR6ZXdraHBzaXN0dWhmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjQzMzY5MjAsImV4cCI6MjAzOTkxMjkyMH0.TsmIoIUBH3AQMC4cllXe0lBNJydLGH6xVwfM47OAq_Q'
  };
  List<BicycleSupaEntity> bicycleSupaEntity=[BicycleSupaEntity(
    id:1,
    photoPath: 'photoPath',
    type: 'type',
    note: 'note',
    size: 1,
    modelName: 'modelName',
    price: 1.1,
  )];
  final  _databicycleSupaEntity = jsonEncode(BicycleSupaModel.fromEntity(bicycleSupaEntity[0]));

  group('add bicycle supa', (){
    test("the response code is 200", ()async{
      dioAdapter.onPost(apiTableBicycle, (server) => server.reply(200,true),
          data: _databicycleSupaEntity,
          headers: headersSupa
      );
      final res=await bicycleApiServiceImp.addBicycleSupa(bicycleSupaEntity[0]);
      expect(res, true);
    });

    test("the response code is 400", ()async{
      dioAdapter.onPost(apiTableBicycle, (server) => server.throws(
        400,
        DioException(
          requestOptions: RequestOptions(
            path: apiTableBicycle,
          ),
        ),
      ),
          data: _databicycleSupaEntity,
          headers: headersSupa
      );
      final res=()async=>await bicycleApiServiceImp.addBicycleSupa(bicycleSupaEntity[0]);
      expect(res,throwsA(isA<SocketException>()));
    });
  });

  group('delete bicycle supa', (){
    test("the response code is 200", ()async{
      dioAdapter.onDelete('${apiTableBicycle}?id=eq.1', (server) => server.reply(200,true),
          headers: headersSupa
      );
      final res=await bicycleApiServiceImp.deleteBicycleSupa(1);
      expect(res, true);
    });

    test("the response code is 400", ()async{
      dioAdapter.onDelete('${apiTableBicycle}?id=eq.1', (server) => server.throws(
        400,
        DioException(
          requestOptions: RequestOptions(
            path: '${apiTableBicycle}?id=eq.1',
          ),
        ),
      ),
          headers: headersSupa
      );
      final res=()async=>await bicycleApiServiceImp.deleteBicycleSupa(1);
      expect(res,throwsA(isA<SocketException>()));
    });
  });

  group('edit bicycle supa', (){
    test("the response code is 200", ()async{
      dioAdapter.onPatch('${apiTableBicycle}?id=eq.1', (server) => server.reply(200,true),
          data: _databicycleSupaEntity,
          headers: headersSupa
      );
      final res=await bicycleApiServiceImp.editBicycleSupa(1,bicycleSupaEntity[0]);
      expect(res, true);
    });

    test("the response code is 400", ()async{
      dioAdapter.onPatch('${apiTableBicycle}?id=eq.1', (server) => server.throws(
        400,
        DioException(
          requestOptions: RequestOptions(
            path: '${apiTableBicycle}?id=eq.1',
          ),
        ),
      ),
          data: _databicycleSupaEntity,
          headers: headersSupa
      );
      final res=()async=>await bicycleApiServiceImp.editBicycleSupa(1,bicycleSupaEntity[0]);
      expect(res,throwsA(isA<SocketException>()));
    });
  });

  group('get bicycle supa', (){
    test("the response code is 200", ()async{
      dioAdapter.onGet('$apiTableBicycle?select=*', (server) => server.reply(200,[
        {
          'id': 1,
          'photoPath': 'photoPath',
          'type': 'type',
          'note': 'note',
          'size': 1,
          'modelName': 'modelName',
          'price': 1.1,
        }]),
          headers: headersSupa
      );
      final res=await bicycleApiServiceImp.getBicylesSupa();
      expect(res, isA<List<BicycleSupaModel>>());
    });

    test("the response code is 400", ()async{
      dioAdapter.onGet('$apiTableBicycle?select=*', (server) => server.throws(
        400,
        DioException(
          requestOptions: RequestOptions(
            path: '$apiTableBicycle?select=*',
          ),
        ),
      ),
          headers: headersSupa
      );
      final res=()async=>await bicycleApiServiceImp.getBicylesSupa();
      expect(res,throwsA(isA<SocketException>()));
    });
  });

  group('get bicycle', (){
    test("the response code is 200", ()async{
      dioAdapter.onGet('$baseUrl$bicycle', (server) => server.reply(200,{
        'body': [
          {
            'id':1,
            'photoPath': 'photoPath',
            'type': 'type',
            'note': 'note',
            'size': 1,
            'model_price': {
              'id':1,
              'price':8.7,
              'model': 'model'
            },
            'maintenance':[]
          }]
        }),

          headers: headers
      );
      final res=await bicycleApiServiceImp.getBicyles();
      expect(res, isA<List<BicycleModel>>());
    });

    test("the response code is 400", ()async{
      dioAdapter.onGet('$baseUrl$bicycle', (server) => server.throws(
        400,
        DioException(
          requestOptions: RequestOptions(
            path: '$baseUrl$bicycle',
          ),
        ),
      ),
          headers: headers
      );
      final res=()async=>await bicycleApiServiceImp.getBicyles();
      expect(res,throwsA(isA<SocketException>()));
    });
  });
}