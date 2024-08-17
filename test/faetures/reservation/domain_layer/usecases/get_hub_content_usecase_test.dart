import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/entities/hub_content_entity.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/usecases/get_hub_content_usecase.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late MockReservationRepository mockReservationRepository;
  late GetHubContentUsecase getHubContentUsecase;

  setUp((){
    mockReservationRepository=MockReservationRepository();
    getHubContentUsecase=GetHubContentUsecase(mockReservationRepository);
  });

  HubContentEntity hubContentEntity=HubContentEntity(
      message: "Get all categories",
      status: "ACCEPTED",
      localDateTime: DateTime(2000,12,1,19,26,50,2345),
      body: null
  );
  test('should send and get from repo successfully', ()async{
    when(mockReservationRepository.getHubContent("Road_bikes", 1)).thenAnswer((_)async=>Right(hubContentEntity));
    final res=await getHubContentUsecase.call("Road_bikes", 1);
    expect(res, Right(hubContentEntity));
  });
}