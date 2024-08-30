import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/features/bicycle_mangement/domain_layer/entities/bicycle_Supa_entity.dart';
import 'package:rental_clean_tdd/features/bicycle_mangement/domain_layer/usecases/get_bicyles_supa_usecase.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late GetBicylesSupaUsecase getBicylesSupaUsecase;
  late MockBicycleRepository mockBicycleRepository;
  setUp((){
    mockBicycleRepository=MockBicycleRepository();
    getBicylesSupaUsecase=GetBicylesSupaUsecase(mockBicycleRepository);
  });
  List<BicycleSupaEntity> bicycleSupaEntity=[BicycleSupaEntity(
      photoPath: 'photoPath',
      type: 'type',
      note: 'note',
      size: 1,
      price: 1.1,
      modelName: 'modelName'
  )];

  test('should send and get from repo successfully',  ()async{
    when(mockBicycleRepository.getBicylesSupa()).thenAnswer((_)async{
      return Right(bicycleSupaEntity);
    });
    final res=await getBicylesSupaUsecase.call('get');
    expect(res, Right(bicycleSupaEntity));
  });
}