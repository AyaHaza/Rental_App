import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/entities/photo_entity.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/usecases/get_photo_usecase.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late MockReservationRepository mockReservationRepository;
  late GetPhotoUsecase getPhotoUsecase;

  setUp((){
    mockReservationRepository=MockReservationRepository();
    getPhotoUsecase=GetPhotoUsecase(mockReservationRepository);
  });

  PhotoEntity photoEntity=PhotoEntity(
      message: "Get all categories",
      status: "ACCEPTED",
      localDateTime: DateTime(2000,12,1,19,26,50,2345),
      body: null
  );
  test('should send and get from repo successfully', ()async{
    when(mockReservationRepository.getPhotos()).thenAnswer((_)async=>Right(photoEntity));
    final res=await getPhotoUsecase.call("Get photos");
    expect(res, Right(photoEntity));
  });
}