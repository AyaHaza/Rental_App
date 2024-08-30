import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/features/bicycle_mangement/domain_layer/usecases/delete_bicycle_supa_usecase.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late DeleteBicycleSupaUsecase deleteBicycleSupaUsecase;
  late MockBicycleRepository mockBicycleRepository;
  setUp((){
    mockBicycleRepository=MockBicycleRepository();
    deleteBicycleSupaUsecase=DeleteBicycleSupaUsecase(mockBicycleRepository);
  });

  test('should send and get from repo successfully',  ()async{
    when(mockBicycleRepository.deleteBicycleSupa(1)).thenAnswer((_)async{
      return Right(true);
    });
    final res=await deleteBicycleSupaUsecase.call(1);
    expect(res, Right(true));
  });
}