import 'package:flutter_test/flutter_test.dart';
import 'package:rental_clean_tdd/features/reservation/data_layer/models/bicycle_category_model.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/entities/bicycle_category_entity.dart';

void main(){
  BicycleCategoryModel bicycleCategoryModel =BicycleCategoryModel(
      message: "Get all categories",
      status: "ACCEPTED",
      localDateTime: DateTime(2000,12,1,19,26,50,2345),
      body:['Road_bikes', 'Mountain_bikes', 'Hybrid_bikes', 'E_bikes']
  );
  final expextedJsonMap={
    'message': 'Get all categories',
    'status': 'ACCEPTED',
    'localDateTime': '2000-12-01T19:26:52.345',
    'body':['Road_bikes', 'Mountain_bikes', 'Hybrid_bikes', 'E_bikes']
  };

  test("BicycleCategoryModel is subclass of BicycleCategoryEntity", ()async{
    expect(bicycleCategoryModel, isA<BicycleCategoryEntity>());
  });

  test("return a json map", ()async{
    final res=bicycleCategoryModel.toJson();
    expect(res, expextedJsonMap);
  });

  //test from json
  test(
      "should be return a vaild from json ", ()async{
    final res=BicycleCategoryModel.fromJson(expextedJsonMap);
    expect(res,bicycleCategoryModel);
  }
  );

}