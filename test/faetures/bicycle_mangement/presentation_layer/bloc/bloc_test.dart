import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/core/error/failure.dart';
import 'package:rental_clean_tdd/features/bicycle_mangement/domain_layer/entities/bicycle_entity.dart';
import 'package:rental_clean_tdd/features/bicycle_mangement/presentation_layer/bloc/bloc.dart';
import 'package:rental_clean_tdd/features/bicycle_mangement/presentation_layer/bloc/events.dart';
import 'package:rental_clean_tdd/features/bicycle_mangement/presentation_layer/bloc/states.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late MockGetBicylesUsecase mockGetBicylesUsecase;
  late BicycleBloc bicycleBloc;

  setUp((){
    mockGetBicylesUsecase=MockGetBicylesUsecase();
    bicycleBloc=BicycleBloc(mockGetBicylesUsecase);
    });

  List<BicycleEntity> bicycleEntity= [BicycleEntity(
      id:1,
      photoPath: 'photoPath',
      type: 'type',
      note: 'note',
      size: 1,
      modelPrice: ModelPriceEntity(
          id:1,
          price: 8.7,
          model: 'model'
      ),
      maintenance:[]
  )];
  group("get bicycles", (){
    blocTest<BicycleBloc,BicycleStates>(
        "should emit [LoadingState,SuccessState] when data is gotten successfully",
        build: (){
          when(mockGetBicylesUsecase.call('get')).thenAnswer((_)async=>Right(bicycleEntity));
          return bicycleBloc;
        },
        act: (bloc)=>bloc.add(GetBicycleEvent()),
        expect: ()=>[
          isA<LoadingState>(),
          isA<SuccessState>()
        ]
    );

    blocTest<BicycleBloc,BicycleStates>(
        "should emit [LoadingState,ErrorState] when data is gotten unsuccessfully",
        build: (){
          when(mockGetBicylesUsecase.call('get')).thenAnswer((_)async=>Left(ServerFailure("server Failure")));
          return bicycleBloc;
        },
        act: (bloc)=>bloc.add(GetBicycleEvent()),
        expect: ()=>[
          isA<LoadingState>(),
          isA<ErrorState>()
        ]
    );
  });
}