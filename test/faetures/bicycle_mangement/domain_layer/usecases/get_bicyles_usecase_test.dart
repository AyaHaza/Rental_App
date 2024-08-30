import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/features/bicycle_mangement/domain_layer/entities/bicycle_entity.dart';
import 'package:rental_clean_tdd/features/bicycle_mangement/domain_layer/usecases/get_bicyles_usecase.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late GetBicylesUsecase getBicylesUsecase;
  late MockBicycleRepository mockBicycleRepository;
  setUp((){
    mockBicycleRepository=MockBicycleRepository();
    getBicylesUsecase=GetBicylesUsecase(mockBicycleRepository);
  });
  List<BicycleEntity> bicycleEntity=[BicycleEntity(
      photoPath: 'photoPath',
      type: 'type',
      note: 'note',
      size: 1,
      modelPrice: null,
      maintenance:[]
  )];

  test('should send and get from repo successfully',  ()async{
    when(mockBicycleRepository.getBicyles()).thenAnswer((_)async{
      return Right(bicycleEntity);
    });
    final res=await getBicylesUsecase.call('get');
    expect(res, Right(bicycleEntity));
  });
}