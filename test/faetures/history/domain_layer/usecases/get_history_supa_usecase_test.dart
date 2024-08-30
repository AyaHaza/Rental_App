import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/features/history/domain_layer/entities/history_entity.dart';
import 'package:rental_clean_tdd/features/history/domain_layer/usecases/get_history_supa_usecase.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late GetHistorySupaUsecase getHistorySupaUsecase;
  late MockHistoryRepository mockHistoryRepository;
  setUp((){
    mockHistoryRepository=MockHistoryRepository();
    getHistorySupaUsecase=GetHistorySupaUsecase(mockHistoryRepository);
  });
  List<HistoryEntity> historyEntity=[HistoryEntity(statrPoint: 'statrPoint', destinationPoint: 'destinationPoint')];

  test('should send and get from repo successfully',  ()async{
    when(mockHistoryRepository.getHistorySupa()).thenAnswer((_)async{
      return Right(historyEntity);
    });
    final res=await getHistorySupaUsecase.call('get');
    expect(res, Right(historyEntity));
  });
}