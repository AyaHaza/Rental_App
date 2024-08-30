import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:latlong2/latlong.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/features/map/domain_layer/usecases/show_path_usecase.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late ShowPathUsecase showPathUsecase;
  late MockMapRepository mockMapRepository;
  setUp((){
    mockMapRepository=MockMapRepository();
    showPathUsecase=ShowPathUsecase(mockMapRepository);
  });
  List<LatLng> latLong=[LatLng(1.1, 1.2)];
  test('should send and get from repo successfully',  ()async{
    when(mockMapRepository.showPath(LatLng(1.1, 1.2), LatLng(2.1, 2.2))).thenAnswer((_)async{
      return Right(latLong);
    });
    final res=await showPathUsecase.call(LatLng(1.1, 1.2), LatLng(2.1, 2.2));
    expect(res, Right(latLong));
  });
}