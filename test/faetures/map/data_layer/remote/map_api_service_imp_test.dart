import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:location/location.dart';
import 'package:rental_clean_tdd/core/resources/variable.dart';
import 'package:rental_clean_tdd/features/map/data_layer/data_source/remote/map_api_service_imp.dart';
import 'package:rental_clean_tdd/features/map/data_layer/models/hubs_model.dart';

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
          id: 1,
          name: 'nmae',
          description:'description' ,
          latitude: 1.1,
          longitude:1.1
      )
    ]
  };
  final headers = <String, dynamic>{
    'accept':'*/*',
    'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdHJpOTk5dHJpIiwiaWF0IjoxNzIzOTExMDA0LCJleHAiOjE3MjM5OTc0MDR9.QiuLOU9Sr9DIgDsgIvb48GAm0uiq5gDb6dA9POmuRIg'
  };

  group('get hubs', (){

    test("return hubsModel when the response code is 200", ()async{
      dioAdapter.onGet('$baseUrl$getHubsApi?longtitude=36.278336&latitude=33.510414', (server) => server.reply(200,hubsModel),
      headers: headers
      );
      final res=await mapApiServiceImp.getHubs(locationData);
      expect(res, hubsModel['body']);
    });

    test("Throw SocketException when the response code is 400", ()async{
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
}