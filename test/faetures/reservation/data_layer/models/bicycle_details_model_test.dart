import 'package:flutter_test/flutter_test.dart';
import 'package:rental_clean_tdd/features/reservation/data_layer/models/bicycle_details_model.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/entities/bicycle_details_entity.dart';

void main(){
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
  final expextedJsonMap={
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
  };

  test("BicycleDetailsModel is subclass of BicycleDetailsEntity", ()async{
    expect(bicycleDetailsModel, isA<BicycleDetailsEntity>());
  });

  test(
      "should be return a vaild from json ", ()async{
    final res=BicycleDetailsModel.fromJson(expextedJsonMap);
    expect(res,bicycleDetailsModel);
  }
  );
}