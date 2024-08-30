import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:rental_clean_tdd/core/resources/variable.dart';
import 'package:rental_clean_tdd/features/reservation/data_layer/data_source/remote/reservation_api_service_imp.dart';
import 'package:rental_clean_tdd/features/reservation/data_layer/models/bicycle_by_category_model.dart';
import 'package:rental_clean_tdd/features/reservation/data_layer/models/bicycle_category_model.dart';
import 'package:rental_clean_tdd/features/reservation/data_layer/models/bicycle_details_model.dart';
import 'package:rental_clean_tdd/features/reservation/data_layer/models/hub_content_model.dart';
import 'package:rental_clean_tdd/features/reservation/data_layer/models/photo_model.dart';

void main(){
  late Dio mockDio;
  late DioAdapter dioAdapter;
  late ReservationApiServiceImp reservationApiServiceImp;

  setUp((){
    mockDio=Dio();
    dioAdapter = DioAdapter(
      dio: mockDio,
      matcher: const FullHttpRequestMatcher(),
    );
    reservationApiServiceImp =ReservationApiServiceImp(mockDio);
  });

  final headers = <String, dynamic>{
    'accept':'*/*',
    'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMjIyODg3NzkxIiwiaWF0IjoxNzI0ODczODIxLCJleHAiOjE3MjQ5NjAyMjF9'
  };

  //--------------------------------------------------------------------------------------------------------------------
  //---------------------------------->start test get bicycle categorey<----------------------------------
  //--------------------------------------------------------------------------------------------------------------------
  BicycleCategoryModel bicycleCategoryModel =BicycleCategoryModel(
      message: "Get all categories",
      status: "ACCEPTED",
      localDateTime: DateTime(2000,12,1,19,26,50,2345),
      body:['Road_bikes', 'Mountain_bikes', 'Hybrid_bikes', 'E_bikes']
  );

  group('get bicycle categorey', (){
    test("return bicycleCategoryModel when the response code is 200", ()async{
      dioAdapter.onGet(baseUrl+getBicycleCategoryApi, (server) => server.reply(200,{
        'message': 'Get all categories',
        'status': 'ACCEPTED',
        'localDateTime': '2000-12-01T19:26:52.345',
        'body':['Road_bikes', 'Mountain_bikes', 'Hybrid_bikes', 'E_bikes']
      }),
          headers: headers
      );
      final res=await reservationApiServiceImp.getBicycleCategory();
      expect(res, bicycleCategoryModel);
    });

    test("Throw SocketException when the response code is 400", ()async{
      dioAdapter.onGet(baseUrl+getBicycleCategoryApi, (server) => server.throws(
        400,
        DioException(
          requestOptions: RequestOptions(
            path: baseUrl+getBicycleCategoryApi,
          ),
        ),
      ),
      headers: headers
      );
      final res=()async=>await reservationApiServiceImp.getBicycleCategory();
      expect(res,throwsA(isA<SocketException>()));
    });
  });
  //--------------------------------------------------------------------------------------------------------------------
  //---------------------------------->end test get bicycle categorey<----------------------------------
  //--------------------------------------------------------------------------------------------------------------------



  //--------------------------------------------------------------------------------------------------------------------
  //---------------------------------->start test get bicycle by categorey<----------------------------------
  //--------------------------------------------------------------------------------------------------------------------
  BicycleByCategoryModel bicycleByCategoryModel =BicycleByCategoryModel(
      message: "Get bicycles by category",
      status: "ACCEPTED",
      localDateTime: DateTime(2000,12,1,19,26,50,2345),
      body:[]
  );

  String category='Road_bikes';
  group('get bicycle by categorey', (){
    test("return bicycleByCategoryModel when the response code is 200", ()async{
      dioAdapter.onGet('$baseUrl$getBicycleByCategoryApi?category=$category', (server) => server.reply(200,
          {
          "message": "Get bicycles by category",
          "status": "ACCEPTED",
          'localDateTime': '2000-12-01T19:26:52.345',
          "body": []
          }),
          headers: headers
      );
      final res=await reservationApiServiceImp.getBicycleByCategory(category);
      expect(res, bicycleByCategoryModel);
    });

    test("Throw SocketException when the response code is 400", ()async{
      dioAdapter.onGet('$baseUrl$getBicycleByCategoryApi?category=$category', (server) => server.throws(
        400,
        DioException(
          requestOptions: RequestOptions(
            path: '$baseUrl$getBicycleByCategoryApi?category=$category',
          ),
        ),
      ),
          headers: headers
      );
      final res=()async=>await reservationApiServiceImp.getBicycleByCategory(category);
      expect(res,throwsA(isA<SocketException>()));
    });
  });
  //--------------------------------------------------------------------------------------------------------------------
  //---------------------------------->end test get bicycle by categorey<----------------------------------
  //--------------------------------------------------------------------------------------------------------------------



  //--------------------------------------------------------------------------------------------------------------------
  //---------------------------------->start test get hub content<----------------------------------
  //--------------------------------------------------------------------------------------------------------------------
  HubContentModel hubContentModel =HubContentModel(
      message: "Get all categories",
      status: "ACCEPTED",
      localDateTime: DateTime(2000,12,1,19,26,50,2345),
      body:BodyHubModel(
        id: 1,
        hubId: 1,
        bicycleList: [],
        note: 'string',
      )
  );
  int hubId=1;
  group('get hub content', (){
    test("return hubContentModel when the response code is 200", ()async{
      dioAdapter.onGet('$baseUrl$getHubContentApi$hubId?bicycleCategory=$category', (server) => server.reply(200,{
        'message': 'Get all categories',
        'status': 'ACCEPTED',
        'localDateTime': '2000-12-01T19:26:52.345',
        'body':{
          "id": 1,
          "hubId": 1,
          "bicycleList": [],
          "note": "string"
        }
      }),
          headers: headers
      );
      final res=await reservationApiServiceImp.getHubContent(category, hubId);
      expect(res, hubContentModel);
    });

    test("Throw SocketException when the response code is 400", ()async{
      dioAdapter.onGet('$baseUrl$getHubContentApi$hubId?bicycleCategory=$category', (server) => server.throws(
        400,
        DioException(
          requestOptions: RequestOptions(
            path: '$baseUrl$getHubContentApi$hubId?bicycleCategory=$category',
          ),
        ),
      ),
          headers: headers
      );
      final res=()async=>await reservationApiServiceImp.getHubContent(category, hubId);
      expect(res,throwsA(isA<SocketException>()));
    });
  });
  //--------------------------------------------------------------------------------------------------------------------
  //---------------------------------->end test get hub content<----------------------------------
  //--------------------------------------------------------------------------------------------------------------------



  //--------------------------------------------------------------------------------------------------------------------
  //---------------------------------->start test get photo<----------------------------------
  //--------------------------------------------------------------------------------------------------------------------
  PhotoModel photoModel =PhotoModel(
      message: "Get all categories",
      status: "ACCEPTED",
      localDateTime: DateTime(2000,12,1,19,26,50,2345),
      body:[]
  );
  group('get photo', (){
    test("return photoModel when the response code is 200", ()async{
      dioAdapter.onGet(baseUrl+getPhoto, (server) => server.reply(200,{
        'message': 'Get all categories',
        'status': 'ACCEPTED',
        'localDateTime': '2000-12-01T19:26:52.345',
        'body':[]
      }),
          headers: headers
      );
      final res=await reservationApiServiceImp.getPhotos();
      expect(res, photoModel);
    });

    test("Throw SocketException when the response code is 400", ()async{
      dioAdapter.onGet(baseUrl+getPhoto, (server) => server.throws(
        400,
        DioException(
          requestOptions: RequestOptions(
            path: baseUrl+getPhoto,
          ),
        ),
      ),
          headers: headers
      );
      final res=()async=>await reservationApiServiceImp.getPhotos();
      expect(res,throwsA(isA<SocketException>()));
    });
  });
  //--------------------------------------------------------------------------------------------------------------------
  //---------------------------------->end test get photo<----------------------------------
  //--------------------------------------------------------------------------------------------------------------------



  //--------------------------------------------------------------------------------------------------------------------
  //---------------------------------->start test get bicycle detail<----------------------------------
  //--------------------------------------------------------------------------------------------------------------------
  ModelPriceDetailsModel modelPriceEntity=ModelPriceDetailsModel(
      id: 1,
      price: 100.20,
      model: "XSAL545"
  );
  BodyDetailsModel bodyModel=BodyDetailsModel(
      id: 1,
      modelPrice: modelPriceEntity,
      size: 17,
      photoPath: "rideshare.devscape.online/images/photo_2024-07-27_18-26-34.jpg",
      type: "Road_bikes",
      note: "nothing yet",
      maintenance: []
  );
  BicycleDetailsModel bicycleDetailsModel =BicycleDetailsModel(
      message: "Get all categories",
      status: "ACCEPTED",
      localDateTime: DateTime(2000,12,1,19,26,50,2345),
      body:bodyModel
  );
  int bicycleId=1;
  group('get bicycle detail', (){
    test("return bicycleDetailsModel when the response code is 200", ()async{
      dioAdapter.onGet('$baseUrl$getBicycleDetailsApi/$bicycleId', (server) => server.reply(200,{
        'message': 'Get all categories',
        'status': 'ACCEPTED',
        'localDateTime': '2000-12-01T19:26:52.345',
        'body':{
          "id": 1,
          "model_price": {
            "id": 1,
            "price": 100.20,
            "model": "XSAL545"
          },
          "size": 17,
          "photoPath": "rideshare.devscape.online/images/photo_2024-07-27_18-26-34.jpg",
          "type": "Road_bikes",
          "note": "nothing yet",
          "maintenance": []
        }
      }),
          headers: headers
      );
      final res=await reservationApiServiceImp.getdetails(bicycleId);
      expect(res, bicycleDetailsModel);
    });

    test("Throw SocketException when the response code is 400", ()async{
      dioAdapter.onGet('$baseUrl$getBicycleDetailsApi/$bicycleId', (server) => server.throws(
        400,
        DioException(
          requestOptions: RequestOptions(
            path: '$baseUrl$getBicycleDetailsApi/$bicycleId',
          ),
        ),
      ),
          headers: headers
      );
      final res=()async=>await reservationApiServiceImp.getdetails(bicycleId);
      expect(res,throwsA(isA<SocketException>()));
    });
  });
  //--------------------------------------------------------------------------------------------------------------------
  //---------------------------------->end test get bicycle detail<----------------------------------
  //--------------------------------------------------------------------------------------------------------------------

}