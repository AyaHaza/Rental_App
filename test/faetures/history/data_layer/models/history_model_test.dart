import 'package:flutter_test/flutter_test.dart';
import 'package:rental_clean_tdd/features/history/data_layer/models/history_model.dart';
import 'package:rental_clean_tdd/features/history/domain_layer/entities/history_entity.dart';

void main(){
  HistoryModel historyModel=HistoryModel(statrPoint: 'statrPoint', destinationPoint: 'destinationPoint');

  final expextedJsonMap={
    'statrPoint': 'statrPoint', 'destinationPoint': 'destinationPoint'
  };

  final expextedEntity= HistoryEntity(
      statrPoint: 'statrPoint', destinationPoint: 'destinationPoint'
  );

  test("HistoryModel is subclass of HistoryEntity", ()async{
    expect(historyModel, isA<HistoryEntity>());
  });

  //test to json
  test("return a json map", ()async{
    final res=historyModel.toJson();
    expect(res, expextedJsonMap);
  });

  //test from json
  test(
      "should be return a vaild from json ", ()async{
    final res=HistoryModel.fromJson(expextedJsonMap);
    expect(res,historyModel);
  }
  );

  //test from entity
  test(
      "should be return a vaild from entity ", ()async{
    final res=HistoryModel.fromEntity(expextedEntity);
    expect(res,historyModel);
  }
  );

}