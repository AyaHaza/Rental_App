import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/features/map/domain_layer/entities/hubs_entity.dart';
import 'package:rental_clean_tdd/features/map/domain_layer/usecases/get_hubs_supa_usecase.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late GetHubsSupaUsecase getHubsSupaUsecase;
  late MockMapRepository mockMapRepository;
  setUp((){
    mockMapRepository=MockMapRepository();
    getHubsSupaUsecase=GetHubsSupaUsecase(mockMapRepository);
  });
  List<HubsEntity> hubsEntity=[HubsEntity(
      name: 'jjl',
      latitude: 1.1,
      longitude: 1.2,
      description: 'jj'
  )];
  test('should send and get from repo successfully',  ()async{
    when(mockMapRepository.getHubsSupa()).thenAnswer((_)async{
      return Right(hubsEntity);
    });
    final res=await getHubsSupaUsecase.call('get');
    expect(res, Right(hubsEntity));
  });
}