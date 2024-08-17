import 'package:flutter_test/flutter_test.dart';
import 'package:rental_clean_tdd/features/reservation/data_layer/models/hub_content_model.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/entities/hub_content_entity.dart';

void main(){
  BodyHubModel bodyModel=BodyHubModel(
    id: 1,
    hubId: 1,
    bicycleList: [],
    note: 'string',
  );
  HubContentModel hubContentModel =HubContentModel(
      message: "Get all categories",
      status: "ACCEPTED",
      localDateTime: DateTime(2000,12,1,19,26,50,2345),
      body:bodyModel
  );
  final expextedJsonMap={
    'message': 'Get all categories',
    'status': 'ACCEPTED',
    'localDateTime': '2000-12-01T19:26:52.345',
    'body':{
      "id": 1,
      "hubId": 1,
      "bicycleList": [],
      "note": "string"
    }
  };

  test("HubContentModel is subclass of HubContentEntity", ()async{
    expect(hubContentModel, isA<HubContentEntity>());
  });

  test(
      "should be return a vaild from json ", ()async{
    final res=HubContentModel.fromJson(expextedJsonMap);
    expect(res,hubContentModel);
  }
  );
}