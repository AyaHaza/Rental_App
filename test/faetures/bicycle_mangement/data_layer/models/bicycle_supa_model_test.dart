import 'package:flutter_test/flutter_test.dart';
import 'package:rental_clean_tdd/features/bicycle_mangement/data_layer/models/bicycle_supa_model.dart';
import 'package:rental_clean_tdd/features/bicycle_mangement/domain_layer/entities/bicycle_Supa_entity.dart';

void main(){
  BicycleSupaModel bicycleSupaModel=BicycleSupaModel(
      id: 1,
      photoPath: 'photoPath',
      type: 'type',
      note: 'note',
      size: 1,
      modelName: 'modelName',
      price: 1.1,
  );
  final expextedJsonMap={
    'id':1,
    'photoPath': 'photoPath',
    'type': 'type',
    'note': 'note',
    'size': 1,
    'modelName': 'modelName',
    'price': 1.1,
  };

  final expextedEntity= BicycleSupaEntity(
      id:1,
      photoPath: 'photoPath',
      type: 'type',
      note: 'note',
      size: 1,
      modelName: 'modelName',
      price: 1.1,
  );

  test("BicycleSupaModel is subclass of BicycleSupaEntity", ()async{
    expect(bicycleSupaModel, isA<BicycleSupaEntity>());
  });


  //test from json
  test(
      "should be return a vaild from json ", ()async{
    final res=BicycleSupaModel.fromJson(expextedJsonMap);
    expect(res,bicycleSupaModel);
  }
  );

  //test from entity
  test(
      "should be return a vaild from entity ", ()async{
    final res=BicycleSupaModel.fromEntity(expextedEntity);
    expect(res,bicycleSupaModel);
  }
  );
}