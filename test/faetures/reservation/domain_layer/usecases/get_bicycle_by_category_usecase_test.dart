import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/entities/bicycle_by_category_entity.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/usecases/get_bicycle_by_category_usecase.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late MockReservationRepository mockReservationRepository;
  late GetBicycleByCategoryUsecase getBicycleByCategoryUsecase;

  setUp((){
    mockReservationRepository=MockReservationRepository();
    getBicycleByCategoryUsecase=GetBicycleByCategoryUsecase(mockReservationRepository);
  });
  BicycleByCategoryEntity bicycleByCategoryEntity =BicycleByCategoryEntity(
      message: "Get all categories",
      status: "ACCEPTED",
      localDateTime: DateTime(2000,12,1,19,26,50,2345),
      body:null
  );

  test('should send and get from repo successfully', ()async{
    when(mockReservationRepository.getBicycleByCategory("Road_bikes")).thenAnswer((_)async=>Right(bicycleByCategoryEntity));
    final res=await getBicycleByCategoryUsecase.call("Road_bikes");
    expect(res, Right(bicycleByCategoryEntity));
  });
}