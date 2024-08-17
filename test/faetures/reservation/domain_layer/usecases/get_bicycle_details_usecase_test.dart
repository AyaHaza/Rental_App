import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/entities/bicycle_details_entity.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/usecases/get_bicycle_details_usecase.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late MockReservationRepository mockReservationRepository;
  late GetBicycleDetailsUsecase getBicycleDetailsUsecase;

  setUp((){
    mockReservationRepository=MockReservationRepository();
    getBicycleDetailsUsecase=GetBicycleDetailsUsecase(mockReservationRepository);
  });

  BicycleDetailsEntity bicycleDetailsEntity=BicycleDetailsEntity(
      message: "Get all categories",
      status: "ACCEPTED",
      localDateTime: DateTime(2000,12,1,19,26,50,2345),
      body: null
  );
  test('should send and get from repo successfully', ()async{
    when(mockReservationRepository.getdetails(1)).thenAnswer((_)async=>Right(bicycleDetailsEntity));
    final res=await getBicycleDetailsUsecase.call(1);
    expect(res, Right(bicycleDetailsEntity));
  });
}