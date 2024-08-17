import 'package:flutter_test/flutter_test.dart';
import 'package:rental_clean_tdd/features/reservation/data_layer/models/bicycle_by_category_model.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/entities/bicycle_by_category_entity.dart';

void main(){
  BicycleByCategoryModel bicycleByCategoryModel =BicycleByCategoryModel(
      message: "Get all categories",
      status: "ACCEPTED",
      localDateTime: DateTime(2000,12,1,19,26,50,2345),
      body:[]
  );
  final expextedJsonMap={
    'message': 'Get all categories',
    'status': 'ACCEPTED',
    'localDateTime': '2000-12-01T19:26:52.345',
    'body':[]
  };

  test("BicycleByCategoryModel is subclass of BicycleByCategoryEntity", ()async{
    expect(bicycleByCategoryModel, isA<BicycleByCategoryEntity>());
  });

  test(
      "should be return a vaild from json ", ()async{
    final res=BicycleByCategoryModel.fromJson(expextedJsonMap);
    expect(res,bicycleByCategoryModel);
    }
  );
}