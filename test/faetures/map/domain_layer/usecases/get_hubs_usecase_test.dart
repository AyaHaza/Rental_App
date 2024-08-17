import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:location/location.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/features/map/domain_layer/entities/hubs_entity.dart';
import 'package:rental_clean_tdd/features/map/domain_layer/usecases/get_hubs_usecase.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late LocationData locationData;
  late MockMapRepository mockMapRepository;
  late GetHubsUsecase getHubsUsecase;

  setUp((){
    locationData=LocationData.fromMap({});
    mockMapRepository=MockMapRepository();
    getHubsUsecase=GetHubsUsecase(mockMapRepository);
  });

  List<HubsEntity> hubsEntity =[HubsEntity(
    id: 1,
    name: 'nmae',
    description:'description' ,
    latitude: 1.1,
    longitude:1.1
  )];
  test('should send and get from repo successfully', ()async{
    when(mockMapRepository.getHubs(locationData)).thenAnswer((_)async=>Right(hubsEntity));
    final res=await getHubsUsecase.call(locationData);
    expect(res, Right(hubsEntity));
  });
}