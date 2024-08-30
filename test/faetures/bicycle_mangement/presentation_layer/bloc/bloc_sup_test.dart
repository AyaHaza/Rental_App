import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/core/error/failure.dart';
import 'package:rental_clean_tdd/features/bicycle_mangement/domain_layer/entities/bicycle_Supa_entity.dart';
import 'package:rental_clean_tdd/features/bicycle_mangement/presentation_layer/bloc/bloc_supa.dart';
import 'package:rental_clean_tdd/features/bicycle_mangement/presentation_layer/bloc/events.dart';
import 'package:rental_clean_tdd/features/bicycle_mangement/presentation_layer/bloc/states.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late MockAddBicycleSupaUsecase mockAddBicycleSupaUsecase;
  late MockEditBicycleSupaUsecase mockEditBicycleSupaUsecase;
  late MockGetBicylesSupaUsecase mockGetBicylesSupaUsecase;
  late MockDeleteBicycleSupaUsecase mockDeleteBicycleSupaUsecase;
  late BicycleSupaBloc bicycleSupaBloc;

  setUp((){
    mockAddBicycleSupaUsecase=MockAddBicycleSupaUsecase();
    mockEditBicycleSupaUsecase=MockEditBicycleSupaUsecase();
    mockGetBicylesSupaUsecase=MockGetBicylesSupaUsecase();
    mockDeleteBicycleSupaUsecase=MockDeleteBicycleSupaUsecase();
    bicycleSupaBloc=BicycleSupaBloc(mockAddBicycleSupaUsecase,mockEditBicycleSupaUsecase,mockGetBicylesSupaUsecase,mockDeleteBicycleSupaUsecase);
  });

  List<BicycleSupaEntity> bicycleSupaEntity=[BicycleSupaEntity(
    id:1,
    photoPath: 'photoPath',
    type: 'type',
    note: 'note',
    size: 1,
    modelName: 'modelName',
    price: 1.1,
  )];

  group("add bicycle supa", (){
    blocTest<BicycleSupaBloc,BicycleStates>(
        "should emit [LoadingState,SuccessState] when data is gotten successfully",
        build: (){
          when(mockAddBicycleSupaUsecase.call(bicycleSupaEntity[0])).thenAnswer((_)async=>Right(true));
          return bicycleSupaBloc;
        },
        act: (bloc)=>bloc.add(AddBicycleSupa(bicycleSupaEntity[0])),
        expect: ()=>[
          isA<LoadingState>(),
          isA<SuccessState>()
        ]
    );

    blocTest<BicycleSupaBloc,BicycleStates>(
        "should emit [LoadingState,ErrorState] when data is gotten unsuccessfully",
        build: (){
          when(mockAddBicycleSupaUsecase.call(bicycleSupaEntity[0])).thenAnswer((_)async=>Left(ServerFailure("server Failure")));
          return bicycleSupaBloc;
        },
        act: (bloc)=>bloc.add(AddBicycleSupa(bicycleSupaEntity[0])),
        expect: ()=>[
          isA<LoadingState>(),
          isA<ErrorState>()
        ]
    );
  });

  group("edit bicycle supa", (){
    blocTest<BicycleSupaBloc,BicycleStates>(
        "should emit [LoadingState,SuccessState] when data is gotten successfully",
        build: (){
          when(mockEditBicycleSupaUsecase.call(1,bicycleSupaEntity[0])).thenAnswer((_)async=>Right(true));
          return bicycleSupaBloc;
        },
        act: (bloc)=>bloc.add(EditBicycleSupa(1,bicycleSupaEntity[0])),
        expect: ()=>[
          isA<LoadingState>(),
          isA<SuccessState>()
        ]
    );

    blocTest<BicycleSupaBloc,BicycleStates>(
        "should emit [LoadingState,ErrorState] when data is gotten unsuccessfully",
        build: (){
          when(mockEditBicycleSupaUsecase.call(1,bicycleSupaEntity[0])).thenAnswer((_)async=>Left(ServerFailure("server Failure")));
          return bicycleSupaBloc;
        },
        act: (bloc)=>bloc.add(EditBicycleSupa(1,bicycleSupaEntity[0])),
        expect: ()=>[
          isA<LoadingState>(),
          isA<ErrorState>()
        ]
    );
  });

  group("get bicycles supa", (){
    blocTest<BicycleSupaBloc,BicycleStates>(
        "should emit [LoadingState,SuccessState] when data is gotten successfully",
        build: (){
          when(mockGetBicylesSupaUsecase.call('get')).thenAnswer((_)async=>Right(bicycleSupaEntity));
          return bicycleSupaBloc;
        },
        act: (bloc)=>bloc.add(GetBicycleEvent()),
        expect: ()=>[
          isA<LoadingState>(),
          isA<SuccessState>()
        ]
    );

    blocTest<BicycleSupaBloc,BicycleStates>(
        "should emit [LoadingState,ErrorState] when data is gotten unsuccessfully",
        build: (){
          when(mockGetBicylesSupaUsecase.call('get')).thenAnswer((_)async=>Left(ServerFailure("server Failure")));
          return bicycleSupaBloc;
        },
        act: (bloc)=>bloc.add(GetBicycleEvent()),
        expect: ()=>[
          isA<LoadingState>(),
          isA<ErrorState>()
        ]
    );
  });

  group("delete bicycle supa", (){
    blocTest<BicycleSupaBloc,BicycleStates>(
        "should emit [LoadingState,SuccessState] when data is gotten successfully",
        build: (){
          when(mockDeleteBicycleSupaUsecase.call(1)).thenAnswer((_)async=>Right(true));
          return bicycleSupaBloc;
        },
        act: (bloc)=>bloc.add(DeleteBicycleSupa(1)),
        expect: ()=>[
          isA<LoadingState>(),
          isA<SuccessBoolState>()
        ]
    );

    blocTest<BicycleSupaBloc,BicycleStates>(
        "should emit [LoadingState,ErrorState] when data is gotten unsuccessfully",
        build: (){
          when(mockDeleteBicycleSupaUsecase.call(1)).thenAnswer((_)async=>Left(ServerFailure("server Failure")));
          return bicycleSupaBloc;
        },
        act: (bloc)=>bloc.add(DeleteBicycleSupa(1)),
        expect: ()=>[
          isA<LoadingState>(),
          isA<ErrorState>()
        ]
    );
  });
}