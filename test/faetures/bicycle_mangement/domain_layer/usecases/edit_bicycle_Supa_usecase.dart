import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/features/bicycle_mangement/domain_layer/entities/bicycle_Supa_entity.dart';
import 'package:rental_clean_tdd/features/bicycle_mangement/domain_layer/usecases/edit_bicycle_Supa_usecase.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late EditBicycleSupaUsecase editBicycleSupaUsecase;
  late MockBicycleRepository mockBicycleRepository;
  setUp((){
    mockBicycleRepository=MockBicycleRepository();
    editBicycleSupaUsecase=EditBicycleSupaUsecase(mockBicycleRepository);
  });
  BicycleSupaEntity bicycleSupaEntity=BicycleSupaEntity(
      photoPath: 'photoPath',
      type: 'type',
      note: 'note',
      size: 1,
      price: 1.1,
      modelName: 'modelName'
  );

  test('should send and get from repo successfully',  ()async{
    when(mockBicycleRepository.editBicycleSupa(1,bicycleSupaEntity)).thenAnswer((_)async{
      return Right(true);
    });
    final res=await editBicycleSupaUsecase.call(1,bicycleSupaEntity);
    expect(res, Right(true));
  });
}