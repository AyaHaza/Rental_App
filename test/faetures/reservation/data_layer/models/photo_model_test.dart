import 'package:flutter_test/flutter_test.dart';
import 'package:rental_clean_tdd/features/reservation/data_layer/models/photo_model.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/entities/photo_entity.dart';

void main(){
  PhotoModel photoModel =PhotoModel(
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

  test("PhotoModel is subclass of PhotoEntity", ()async{
    expect(photoModel, isA<PhotoEntity>());
  });

  test(
      "should be return a vaild from json ", ()async{
    final res=PhotoModel.fromJson(expextedJsonMap);
    expect(res,photoModel);
  }
  );
}