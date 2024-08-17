import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/entities/bicycle_category_entity.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/usecases/get_bicycle_category_usecase.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late MockReservationRepository mockReservationRepository;
  late GetBicycleCategoryUsecase getBicycleCategoryUsecase;

  setUp((){
    mockReservationRepository=MockReservationRepository();
    getBicycleCategoryUsecase=GetBicycleCategoryUsecase(mockReservationRepository);
  });
  BicycleCategoryEntity bicycleCategoryEntity =BicycleCategoryEntity(
      message: "Get all categories",
      status: "ACCEPTED",
      localDateTime: DateTime(2000,12,1,19,26,50,2345),
      body:['Road_bikes', 'Mountain_bikes', 'Hybrid_bikes', 'E_bikes']
  );

  test('should send and get from repo successfully', ()async{
    when(mockReservationRepository.getBicycleCategory()).thenAnswer((_)async=>Right(bicycleCategoryEntity));
    final res=await getBicycleCategoryUsecase.call("Get bicycle category");
    expect(res, Right(bicycleCategoryEntity));
  });
}