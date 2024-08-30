import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/features/history/domain_layer/entities/history_entity.dart';
import 'package:rental_clean_tdd/features/history/domain_layer/usecases/add_to_history_supa_usecase.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late AddToHistorySupaUsecase addToHistorySupaUsecase;
  late MockHistoryRepository mockHistoryRepository;
  setUp((){
    mockHistoryRepository=MockHistoryRepository();
    addToHistorySupaUsecase=AddToHistorySupaUsecase(mockHistoryRepository);
  });
  HistoryEntity historyEntity=HistoryEntity(statrPoint: 'statrPoint', destinationPoint: 'destinationPoint');

  test('should send and get from repo successfully',  ()async{
    when(mockHistoryRepository.addToHistorySupa(historyEntity)).thenAnswer((_)async{
      return Right(true);
    });
    final res=await addToHistorySupaUsecase.call(historyEntity);
    expect(res, Right(true));
  });
}