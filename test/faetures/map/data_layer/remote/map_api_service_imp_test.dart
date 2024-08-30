import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:location/location.dart';
import 'package:rental_clean_tdd/core/resources/variable.dart';
import 'package:rental_clean_tdd/features/map/data_layer/data_source/remote/map_api_service_imp.dart';
import 'package:rental_clean_tdd/features/map/data_layer/models/hubs_model.dart';
import 'package:rental_clean_tdd/features/map/domain_layer/entities/hubs_entity.dart';

void main(){
  late LocationData locationData;
  late Dio mockDio;
  late DioAdapter dioAdapter;
  late MapApiServiceImp mapApiServiceImp;
  
  setUp((){
    locationData=LocationData.fromMap({});
    mockDio=Dio();
    dioAdapter = DioAdapter(
      dio: mockDio,
      matcher: const FullHttpRequestMatcher(),
    );
    mapApiServiceImp =MapApiServiceImp(mockDio);
  });

  Map hubsModel={
    'body':[
      HubsModel(
          name: 'nmae',
          description:'description' ,
          latitude: 1.1,
          longitude:1.1
      )
    ]
  };
  final headers = <String, dynamic>{
    'accept':'*/*',
    'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMjIyODg3NzkxIiwiaWF0IjoxNzI0ODczODIxLCJleHAiOjE3MjQ5NjAyMjF9'
  };

  final headersSupa = <String, dynamic>{
    'apiKey': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5sdWx2anR6ZXdraHBzaXN0dWhmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjQzMzY5MjAsImV4cCI6MjAzOTkxMjkyMH0.TsmIoIUBH3AQMC4cllXe0lBNJydLGH6xVwfM47OAq_Q'
  };
  HubsEntity hubsEntity=HubsEntity(
      name: 'nmae',
      description:'description' ,
      latitude: 1.1,
      longitude:1.1
  );
  final  _datahubsEntity = jsonEncode(HubsModel.fromEntity(hubsEntity));


  group('get hubs', (){
    test("the response code is 200", ()async{
      dioAdapter.onGet('$baseUrl$getHubsApi?longtitude=36.278336&latitude=33.510414', (server) => server.reply(200,hubsModel),
      headers: headers
      );
      final res=await mapApiServiceImp.getHubs(locationData);
      expect(res, hubsModel['body']);
    });

    test("the response code is 400", ()async{
      dioAdapter.onGet('$baseUrl$getHubsApi?longtitude=36.278336&latitude=33.510414', (server) => server.throws(
        400,
        DioException(
          requestOptions: RequestOptions(
            path: '$baseUrl$getHubsApi?longtitude=36.278336&latitude=33.510414',
          ),
        ),
      ),
       headers: headers
      );
      final res=()async=>await mapApiServiceImp.getHubs(locationData);
      expect(res,throwsA(isA<SocketException>()));
    });
  });

  group('add hubs supa', (){
    test("the response code is 200", ()async{
      dioAdapter.onPost(apiTableHubs, (server) => server.reply(200,true),
          data: _datahubsEntity,
          headers: headersSupa
      );
      final res=await mapApiServiceImp.addHubsSupa(hubsEntity);
      expect(res, true);
    });

    test("the response code is 400", ()async{
      dioAdapter.onPost(apiTableHubs, (server) => server.throws(
        400,
        DioException(
          requestOptions: RequestOptions(
            path: apiTableHubs,
          ),
        ),
      ),
          data: _datahubsEntity,
          headers: headersSupa
      );
      final res=()async=>await mapApiServiceImp.addHubsSupa(hubsEntity);
      expect(res,throwsA(isA<SocketException>()));
    });
  });

  group('edit hubs supa', (){
    test("the response code is 200", ()async{
      dioAdapter.onPatch('${apiTableHubs}?id=eq.1', (server) => server.reply(200,true),
          data: _datahubsEntity,
          headers: headersSupa
      );
      final res=await mapApiServiceImp.editHubsSupa(1,hubsEntity);
      expect(res, true);
    });

    test("the response code is 400", ()async{
      dioAdapter.onPatch('${apiTableHubs}?id=eq.1', (server) => server.throws(
        400,
        DioException(
          requestOptions: RequestOptions(
            path: '${apiTableHubs}?id=eq.1',
          ),
        ),
      ),
          data: _datahubsEntity,
          headers: headersSupa
      );
      final res=()async=>await mapApiServiceImp.editHubsSupa(1,hubsEntity);
      expect(res,throwsA(isA<SocketException>()));
    });
  });

  group('delete hubs supa', (){
    test("the response code is 200", ()async{
      dioAdapter.onDelete('${apiTableHubs}?id=eq.1', (server) => server.reply(200,true),
          headers: headersSupa
      );
      final res=await mapApiServiceImp.deleteHubsSupa(1);
      expect(res, true);
    });

    test(" the response code is 400", ()async{
      dioAdapter.onDelete('${apiTableHubs}?id=eq.1', (server) => server.throws(
        400,
        DioException(
          requestOptions: RequestOptions(
            path: '${apiTableHubs}?id=eq.1',
          ),
        ),
      ),
          headers: headersSupa
      );
      final res=()async=>await mapApiServiceImp.deleteHubsSupa(1);
      expect(res,throwsA(isA<SocketException>()));
    });
  });

  group('get hubs supa', (){
    test(" the response code is 200", ()async{
      dioAdapter.onGet('${apiTableHubs}?select=*', (server) => server.reply(200,[{
        'name': 'name',
        'latitude': 1.1,
        'longitude': 1.1,
        'description': 'description'
      }]),
          headers: headersSupa
      );
      final res=await mapApiServiceImp.getHubsSupa();
      expect(res, isA<List<HubsModel>>());
    });

    test(" the response code is 400", ()async{
      dioAdapter.onGet('${apiTableHubs}?select=*', (server) => server.throws(
        400,
        DioException(
          requestOptions: RequestOptions(
            path: '${apiTableHubs}?select=*',
          ),
        ),
      ),
          headers: headersSupa
      );
      final res=()async=>await mapApiServiceImp.getHubsSupa();
      expect(res,throwsA(isA<SocketException>()));
    });
  });

}