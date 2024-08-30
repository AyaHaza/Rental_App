import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/core/error/failure.dart';
import 'package:rental_clean_tdd/features/history/domain_layer/entities/history_entity.dart';
import 'package:rental_clean_tdd/features/map/domain_layer/entities/hubs_entity.dart';
import 'package:rental_clean_tdd/features/map/presentation_layer/bloc/events.dart';
import 'package:rental_clean_tdd/features/map/presentation_layer/bloc/hubs_bloc.dart';
import 'package:rental_clean_tdd/features/map/presentation_layer/bloc/hubs_supa_bloc.dart';
import 'package:rental_clean_tdd/features/map/presentation_layer/bloc/location_bloc.dart';
import 'package:rental_clean_tdd/features/map/presentation_layer/bloc/path_bloc.dart';
import 'package:rental_clean_tdd/features/map/presentation_layer/bloc/states.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late LocationData locationData;
  late MockGetLocationUsecase mockGetLocationUsecase;
  late MockGetHubsUsecase mockGetHubsUsecase;
  late MockShowPathUsecase mockShowPathUsecase;
  late MockAddHubsSupaUsecase mockAddHubsSupaUsecase;
  late MockEditHubsSupaUsecase mockEditHubsSupaUsecase;
  late MockGetHubsSupaUsecase mockGetHubsSupaUsecase;
  late MockDeleteHubsSupaUsecase mockDeleteHubsSupaUsecase;
  late MapLocationBloc mapLocationBloc;
  late MapHubsBloc mapHubsBloc;
  late MapHubsSupaBloc mapHubsSupaBloc;
  late ShowPathBloc showPathBloc;

  setUp((){
    locationData=LocationData.fromMap({});
    mockGetLocationUsecase=MockGetLocationUsecase();
    mockGetHubsUsecase=MockGetHubsUsecase();
    mockDeleteHubsSupaUsecase=MockDeleteHubsSupaUsecase();
    mockGetHubsSupaUsecase=MockGetHubsSupaUsecase();
    mockEditHubsSupaUsecase=MockEditHubsSupaUsecase();
    mockAddHubsSupaUsecase=MockAddHubsSupaUsecase();
    mockShowPathUsecase=MockShowPathUsecase();

    mapLocationBloc=MapLocationBloc(mockGetLocationUsecase);
    mapHubsBloc=MapHubsBloc(mockGetHubsUsecase);
    mapHubsSupaBloc=MapHubsSupaBloc(mockAddHubsSupaUsecase, mockEditHubsSupaUsecase, mockGetHubsSupaUsecase, mockDeleteHubsSupaUsecase);
    showPathBloc=ShowPathBloc(mockShowPathUsecase);
  });
  List<HubsEntity> hubsEntity =[HubsEntity(
      id: 1,
      name: 'nmae',
      description:'description' ,
      latitude: 1.1,
      longitude:1.1
  )];
  List<HistoryEntity> historyEntity=[HistoryEntity(statrPoint: 'statrPoint', destinationPoint: 'destinationPoint')];
  List<LatLng> latLong=[LatLng(1.1, 1.2)];


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

  group('add Hubs Supa', (){
    blocTest<MapHubsSupaBloc,MapStates>(
        'should emit [MapSuccess] when data is gotten successfully"',
        build: (){
          when(mockAddHubsSupaUsecase.call(hubsEntity[0])).thenAnswer((_)async=>Right(true));
          return mapHubsSupaBloc;
        },
        act: (bloc)=>bloc.add(AddHubsSupaEvent(hubsEntity[0])),
        expect: ()=>[
          isA<LoadingState>(),
          isA<SuccessBoolState>()
        ]
    );

    blocTest<MapHubsSupaBloc,MapStates>(
        'should emit [MapError] when data is gotten unsuccessfully"',
        build: (){
          when(mockAddHubsSupaUsecase.call(hubsEntity[0])).thenAnswer((_)async=>Left(ConnectionFailure("Failed to connect to the network")));
          return mapHubsSupaBloc;
        },
        act: (bloc)=>bloc.add(AddHubsSupaEvent(hubsEntity[0])),
        expect: ()=>[
          isA<LoadingState>(),
          isA<ErrorState>()
        ]
    );
  });

  group('edit Hubs Supa', (){
    blocTest<MapHubsSupaBloc,MapStates>(
        'should emit [MapSuccess] when data is gotten successfully"',
        build: (){
          when(mockEditHubsSupaUsecase.call(1,hubsEntity[0])).thenAnswer((_)async=>Right(true));
          return mapHubsSupaBloc;
        },
        act: (bloc)=>bloc.add(EditHubsSupaEvent(1,hubsEntity[0])),
        expect: ()=>[
          isA<LoadingState>(),
          isA<SuccessBoolState>()
        ]
    );

    blocTest<MapHubsSupaBloc,MapStates>(
        'should emit [MapError] when data is gotten unsuccessfully"',
        build: (){
          when(mockEditHubsSupaUsecase.call(1,hubsEntity[0])).thenAnswer((_)async=>Left(ConnectionFailure("Failed to connect to the network")));
          return mapHubsSupaBloc;
        },
        act: (bloc)=>bloc.add(EditHubsSupaEvent(1,hubsEntity[0])),
        expect: ()=>[
          isA<LoadingState>(),
          isA<ErrorState>()
        ]
    );
  });

  group('get Hubs Supa', (){
    blocTest<MapHubsSupaBloc,MapStates>(
        'should emit [MapSuccess] when data is gotten successfully"',
        build: (){
          when(mockGetHubsSupaUsecase.call('get')).thenAnswer((_)async=>Right(hubsEntity));
          return mapHubsSupaBloc;
        },
        act: (bloc)=>bloc.add(GetHubsSupaEvent()),
        expect: ()=>[
          isA<LoadingState>(),
          isA<SuccessState>()
        ]
    );

    blocTest<MapHubsSupaBloc,MapStates>(
        'should emit [MapError] when data is gotten unsuccessfully"',
        build: (){
          when(mockGetHubsSupaUsecase.call('get')).thenAnswer((_)async=>Left(ConnectionFailure("Failed to connect to the network")));
          return mapHubsSupaBloc;
        },
        act: (bloc)=>bloc.add(GetHubsSupaEvent()),
        expect: ()=>[
          isA<LoadingState>(),
          isA<ErrorState>()
        ]
    );
  });

  group('delete Hubs Supa', (){
    blocTest<MapHubsSupaBloc,MapStates>(
        'should emit [MapSuccess] when data is gotten successfully"',
        build: (){
          when(mockDeleteHubsSupaUsecase.call(1)).thenAnswer((_)async=>Right(true));
          return mapHubsSupaBloc;
        },
        act: (bloc)=>bloc.add(DeleteHubsSupaEvent(1)),
        expect: ()=>[
          isA<LoadingState>(),
          isA<SuccessBoolState>()
        ]
    );

    blocTest<MapHubsSupaBloc,MapStates>(
        'should emit [MapError] when data is gotten unsuccessfully"',
        build: (){
          when(mockDeleteHubsSupaUsecase.call(1)).thenAnswer((_)async=>Left(ConnectionFailure("Failed to connect to the network")));
          return mapHubsSupaBloc;
        },
        act: (bloc)=>bloc.add(DeleteHubsSupaEvent(1)),
        expect: ()=>[
          isA<LoadingState>(),
          isA<ErrorState>()
        ]
    );
  });

  group('show path', (){
    blocTest<ShowPathBloc,MapStates>(
        'should emit [MapSuccess] when data is gotten successfully"',
        build: (){
          when(mockShowPathUsecase.call(LatLng(1.1, 1.2), LatLng(2.1, 2.2))).thenAnswer((_)async=>Right(latLong));
          return showPathBloc;
        },
        act: (bloc)=>bloc.add(ShowPathEvent(LatLng(1.1, 1.2), LatLng(2.1, 2.2))),
        expect: ()=>[
          isA<LoadingState>(),
          isA<SuccessState>()
        ]
    );

    blocTest<ShowPathBloc,MapStates>(
        'should emit [MapError] when data is gotten unsuccessfully"',
        build: (){
          when(mockShowPathUsecase.call(LatLng(1.1, 1.2), LatLng(2.1, 2.2))).thenAnswer((_)async=>Left(ConnectionFailure("Failed to connect to the network")));
          return showPathBloc;
        },
        act: (bloc)=>bloc.add(ShowPathEvent(LatLng(1.1, 1.2), LatLng(2.1, 2.2))),
        expect: ()=>[
          isA<LoadingState>(),
          isA<ErrorState>()
        ]
    );
  });
}