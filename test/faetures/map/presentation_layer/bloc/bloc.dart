import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:location/location.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/core/error/failure.dart';
import 'package:rental_clean_tdd/features/map/domain_layer/entities/hubs_entity.dart';
import 'package:rental_clean_tdd/features/map/presentation_layer/bloc/events.dart';
import 'package:rental_clean_tdd/features/map/presentation_layer/bloc/hubs_bloc.dart';
import 'package:rental_clean_tdd/features/map/presentation_layer/bloc/location_bloc.dart';
import 'package:rental_clean_tdd/features/map/presentation_layer/bloc/states.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late LocationData locationData;
  late MockGetLocationUsecase mockGetLocationUsecase;
  late MockGetHubsUsecase mockGetHubsUsecase;
  late MapLocationBloc mapLocationBloc;
  late MapHubsBloc mapHubsBloc;

  setUp((){
    locationData=LocationData.fromMap({});
    mockGetLocationUsecase=MockGetLocationUsecase();
    mockGetHubsUsecase=MockGetHubsUsecase();
    mapLocationBloc=MapLocationBloc(mockGetLocationUsecase);
    mapHubsBloc=MapHubsBloc(mockGetHubsUsecase);
  });
  List<HubsEntity> hubsEntity =[HubsEntity(
      id: 1,
      name: 'nmae',
      description:'description' ,
      latitude: 1.1,
      longitude:1.1
  )];

  group('get location', (){
    blocTest<MapLocationBloc,MapStates>(
        'should emit [MapLoading,MapSuccess] when data is gotten successfully"',
        build: (){
          when(mockGetLocationUsecase.call("get location")).thenAnswer((_)async=>Right(locationData));
          return mapLocationBloc;
        },
      act: (bloc)=>bloc.add(GetLocationEvent()),
      expect: ()=>[
        isA<LoadingState>(),
        isA<SuccessState>()
      ]
    );

    blocTest<MapLocationBloc,MapStates>(
        'should emit [MapLoading,MapError] when data is gotten unsuccessfully"',
        build: (){
          when(mockGetLocationUsecase.call("get location")).thenAnswer((_)async=>Left(ConnectionFailure("Failed to connect to the network")));
          return mapLocationBloc;
        },
        act: (bloc)=>bloc.add(GetLocationEvent()),
        expect: ()=>[
          isA<LoadingState>(),
          isA<ErrorState>()
        ]
    );
  });

  group('get Hubs', (){
    blocTest<MapHubsBloc,MapStates>(
        'should emit [MapSuccess] when data is gotten successfully"',
        build: (){
          when(mockGetHubsUsecase.call(locationData)).thenAnswer((_)async=>Right(hubsEntity));
          return mapHubsBloc;
        },
        act: (bloc)=>bloc.add(GetHubsEvent(locationData)),
        expect: ()=>[
          isA<SuccessState>()
        ]
    );

    blocTest<MapHubsBloc,MapStates>(
        'should emit [MapError] when data is gotten unsuccessfully"',
        build: (){
          when(mockGetHubsUsecase.call(locationData)).thenAnswer((_)async=>Left(ConnectionFailure("Failed to connect to the network")));
          return mapHubsBloc;
        },
        act: (bloc)=>bloc.add(GetHubsEvent(locationData)),
        expect: ()=>[
          isA<ErrorState>()
        ]
    );
  });
}