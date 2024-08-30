import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/features/map/domain_layer/usecases/delete_hubs_supa_usecase.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late DeleteHubsSupaUsecase deleteHubsSupaUsecase;
  late MockMapRepository mockMapRepository;
  setUp((){
    mockMapRepository=MockMapRepository();
    deleteHubsSupaUsecase=DeleteHubsSupaUsecase(mockMapRepository);
  });

  test('should send and get from repo successfully',  ()async{
    when(mockMapRepository.deleteHubsSupa(1)).thenAnswer((_)async{
      return Right(true);
    });
    final res=await deleteHubsSupaUsecase.call(1);
    expect(res, Right(true));
  });
}