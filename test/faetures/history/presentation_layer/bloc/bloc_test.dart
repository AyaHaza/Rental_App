import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/core/error/failure.dart';
import 'package:rental_clean_tdd/features/history/domain_layer/entities/history_entity.dart';
import 'package:rental_clean_tdd/features/history/presentation_layer/bloc/bloc.dart';
import 'package:rental_clean_tdd/features/history/presentation_layer/bloc/events.dart';
import 'package:rental_clean_tdd/features/history/presentation_layer/bloc/states.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late MockAddToHistorySupaUsecase mockAddToHistorySupaUsecase;
  late MockGetHistorySupaUsecase mockGetHistorySupaUsecase;
  late MockDeleteHistorySupaUsecase mockDeleteHistorySupaUsecase;
  late HistoryBloc historyBloc;

  setUp((){

    mockAddToHistorySupaUsecase=MockAddToHistorySupaUsecase();
    mockGetHistorySupaUsecase=MockGetHistorySupaUsecase();
    mockDeleteHistorySupaUsecase=MockDeleteHistorySupaUsecase();
    historyBloc=HistoryBloc(mockAddToHistorySupaUsecase,mockGetHistorySupaUsecase,mockDeleteHistorySupaUsecase);
  });

  List<HistoryEntity> historyEntity=[HistoryEntity(statrPoint: 'statrPoint', destinationPoint: 'destinationPoint')];

  group('add history supa', (){
    blocTest<HistoryBloc,HistoryStates>(
        'should emit [MapSuccess] when data is gotten successfully"',
        build: (){
          when(mockAddToHistorySupaUsecase.call(historyEntity[0])).thenAnswer((_)async=>Right(true));
          return historyBloc;
        },
        act: (bloc)=>bloc.add(AddToHistoryEvent(historyEntity[0])),
        expect: ()=>[
          isA<LoadingState>(),
          isA<SuccessState>()
        ]
    );

    blocTest<HistoryBloc,HistoryStates>(
        'should emit [MapError] when data is gotten unsuccessfully"',
        build: (){
          when(mockAddToHistorySupaUsecase.call(historyEntity[0])).thenAnswer((_)async=>Left(ConnectionFailure("Failed to connect to the network")));
          return historyBloc;
        },
        act: (bloc)=>bloc.add(AddToHistoryEvent(historyEntity[0])),
        expect: ()=>[
          isA<LoadingState>(),
          isA<ErrorState>()
        ]
    );
  });

  group('git history supa', (){
    blocTest<HistoryBloc,HistoryStates>(
        'should emit [MapSuccess] when data is gotten successfully"',
        build: (){
          when(mockGetHistorySupaUsecase.call('get')).thenAnswer((_)async=>Right(historyEntity));
          return historyBloc;
        },
        act: (bloc)=>bloc.add(GetHistoryEvent()),
        expect: ()=>[
          isA<LoadingState>(),
          isA<SuccessState>()
        ]
    );

    blocTest<HistoryBloc,HistoryStates>(
        'should emit [MapError] when data is gotten unsuccessfully"',
        build: (){
          when(mockGetHistorySupaUsecase.call('get')).thenAnswer((_)async=>Left(ConnectionFailure("Failed to connect to the network")));
          return historyBloc;
        },
        act: (bloc)=>bloc.add(GetHistoryEvent()),
        expect: ()=>[
          isA<LoadingState>(),
          isA<ErrorState>()
        ]
    );
  });

  group('delete history supa', (){
    blocTest<HistoryBloc,HistoryStates>(
        'should emit [MapSuccess] when data is gotten successfully"',
        build: (){
          when(mockDeleteHistorySupaUsecase.call(1)).thenAnswer((_)async=>Right(true));
          return historyBloc;
        },
        act: (bloc)=>bloc.add(DeleteHistoryEvent(1)),
        expect: ()=>[
          isA<LoadingState>(),
          isA<SuccessBoolState>()
        ]
    );

    blocTest<HistoryBloc,HistoryStates>(
        'should emit [MapError] when data is gotten unsuccessfully"',
        build: (){
          when(mockDeleteHistorySupaUsecase.call(1)).thenAnswer((_)async=>Left(ConnectionFailure("Failed to connect to the network")));
          return historyBloc;
        },
        act: (bloc)=>bloc.add(DeleteHistoryEvent(1)),
        expect: ()=>[
          isA<LoadingState>(),
          isA<ErrorState>()
        ]
    );
  });
}