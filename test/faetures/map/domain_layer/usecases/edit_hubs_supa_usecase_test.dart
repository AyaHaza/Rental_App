import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/features/map/domain_layer/entities/hubs_entity.dart';
import 'package:rental_clean_tdd/features/map/domain_layer/usecases/edit_hubs_supa_usecase.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late EditHubsSupaUsecase editHubsSupaUsecase;
  late MockMapRepository mockMapRepository;
  setUp((){
    mockMapRepository=MockMapRepository();
    editHubsSupaUsecase=EditHubsSupaUsecase(mockMapRepository);
  });
  HubsEntity hubsEntity=HubsEntity(
      name: 'jjl',
      latitude: 1.1,
      longitude: 1.2,
      description: 'jj'
  );

  test('should send and get from repo successfully',  ()async{
    when(mockMapRepository.editHubsSupa(1,hubsEntity)).thenAnswer((_)async{
      return Right(true);
    });
    final res=await editHubsSupaUsecase.call(1,hubsEntity);
    expect(res, Right(true));
  });
}