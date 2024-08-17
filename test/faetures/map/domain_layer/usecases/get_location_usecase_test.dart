import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:location/location.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/features/map/domain_layer/usecases/get_location_usecase.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late LocationData locationData;
  late MockMapRepository mockMapRepository;
  late GetLocationUsecase getLocationUsecase;

  setUp((){
    locationData=LocationData.fromMap({});
    mockMapRepository=MockMapRepository();
    getLocationUsecase=GetLocationUsecase(mockMapRepository);

  });
  test('should send and get from repo successfully', ()async{
    when(mockMapRepository.getCurrentLocation()).thenAnswer((_)async=>Right(locationData));
    final res=await getLocationUsecase.call("get location");
    expect(res, Right(locationData));
  });
}