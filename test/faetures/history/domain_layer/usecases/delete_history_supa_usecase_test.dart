import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/features/history/domain_layer/usecases/delete_history_supa_usecase.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late DeleteHistorySupaUsecase deleteHistorySupaUsecase;
  late MockHistoryRepository mockHistoryRepository;
  setUp((){
    mockHistoryRepository=MockHistoryRepository();
    deleteHistorySupaUsecase=DeleteHistorySupaUsecase(mockHistoryRepository);
  });

  test('should send and get from repo successfully',  ()async{
    when(mockHistoryRepository.deleteHistorySupa(1)).thenAnswer((_)async{
      return Right(true);
    });
    final res=await deleteHistorySupaUsecase.call(1);
    expect(res, Right(true));
  });
}