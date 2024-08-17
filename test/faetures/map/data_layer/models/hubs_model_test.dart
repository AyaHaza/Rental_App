import 'package:flutter_test/flutter_test.dart';
import 'package:rental_clean_tdd/features/map/data_layer/models/hubs_model.dart';
import 'package:rental_clean_tdd/features/map/domain_layer/entities/hubs_entity.dart';

void main(){
  HubsModel hubsModel=HubsModel(
      id: 1,
      name: 'nmae',
      latitude: 1.1,
      longitude: 1.1,
      description: 'description'
  );
  final expextedJsonMap={
    'id': 1,
    'name': 'nmae',
    'latitude': 1.1,
    'longitude': 1.1,
    'description': 'description'
  };

  test("HubsModel is subclass of HubsEntity", ()async{
    expect(hubsModel, isA<HubsEntity>());
  });

  test("return a json map", ()async{
    final res=hubsModel.toJson();
    expect(res, expextedJsonMap);
  });

  //test from json
  test(
      "should be return a vaild from json ", ()async{
        final res=HubsModel.fromJson(expextedJsonMap);
        expect(res,hubsModel);
      }
  );

}