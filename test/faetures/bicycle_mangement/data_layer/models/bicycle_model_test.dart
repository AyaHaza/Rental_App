import 'package:flutter_test/flutter_test.dart';
import 'package:rental_clean_tdd/features/bicycle_mangement/data_layer/models/bicycle_model.dart';
import 'package:rental_clean_tdd/features/bicycle_mangement/domain_layer/entities/bicycle_entity.dart';

void main(){
  BicycleModel bicycleModel=BicycleModel(
      id: 1,
      photoPath: 'photoPath',
      type: 'type',
      note: 'note',
      size: 1,
      modelPrice: ModelPrice(
          id:1,
          price: 8.7,
          model: 'model'
      ),
      maintenance:[]
  );
  final expextedJsonMap={
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
  };

  final expextedEntity= BicycleEntity(
      id:1,
      photoPath: 'photoPath',
      type: 'type',
      note: 'note',
      size: 1,
      modelPrice: ModelPriceEntity(
        id:1,
        price: 8.7,
        model: 'model'
      ),
      maintenance:[]
  );

  test("BicycleModel is subclass of BicycleEntity", ()async{
    expect(bicycleModel, isA<BicycleEntity>());
  });


  //test from json
  test(
      "should be return a vaild from json ", ()async{
    final res=BicycleModel.fromJson(expextedJsonMap);
    expect(res,bicycleModel);
  }
  );

  //test from entity
  test(
      "should be return a vaild from entity ", ()async{
    final res=BicycleModel.fromEntity(expextedEntity);
    expect(res,bicycleModel);
  }
  );
}