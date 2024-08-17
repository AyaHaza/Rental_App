import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/core/error/failure.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/entities/bicycle_by_category_entity.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/entities/bicycle_category_entity.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/entities/bicycle_details_entity.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/entities/hub_content_entity.dart';
import 'package:rental_clean_tdd/features/reservation/domain_layer/entities/photo_entity.dart';
import 'package:rental_clean_tdd/features/reservation/presentation_layer/bloc/bloc.dart';
import 'package:rental_clean_tdd/features/reservation/presentation_layer/bloc/events.dart';
import 'package:rental_clean_tdd/features/reservation/presentation_layer/bloc/photo_bloc.dart';
import 'package:rental_clean_tdd/features/reservation/presentation_layer/bloc/states.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late MockGetBicycleCategoryUsecase mockGetBicycleCategoryUsecase;
  late MockGetBicycleByCategoryUsecase mockGetBicycleByCategoryUsecase;
  late MockGetHubContentUsecase mockGetHubContentUsecase;
  late MockGetPhotoUsecase mockGetPhotoUsecase;
  late MockGetBicycleDetailsUsecase mockGetBicycleDetailsUsecase;
  late ReservationBloc reservationBloc;
  late ReservationPhotosBloc reservationPhotosBloc;

  setUp((){
    mockGetBicycleCategoryUsecase=MockGetBicycleCategoryUsecase();
    mockGetBicycleByCategoryUsecase=MockGetBicycleByCategoryUsecase();
    mockGetHubContentUsecase=MockGetHubContentUsecase();
    mockGetPhotoUsecase=MockGetPhotoUsecase();
    mockGetBicycleDetailsUsecase=MockGetBicycleDetailsUsecase();
    reservationBloc=ReservationBloc(mockGetBicycleCategoryUsecase, mockGetBicycleByCategoryUsecase, mockGetHubContentUsecase, mockGetBicycleDetailsUsecase);
    reservationPhotosBloc=ReservationPhotosBloc(mockGetPhotoUsecase);
  });

  BicycleCategoryEntity bicycleCategoryEntity =BicycleCategoryEntity(
      message: "Get all categories",
      status: "ACCEPTED",
      localDateTime: DateTime(2000,12,1,19,26,50,2345),
      body:['Road_bikes', 'Mountain_bikes', 'Hybrid_bikes', 'E_bikes']
  );
  group('get bicycle gategory', (){
    blocTest<ReservationBloc,ReservationStates>(
        'should emit [ReservationLoading,ReservationSuccess] when data is gotten successfully"',
        build: (){
          when(mockGetBicycleCategoryUsecase.call("Get bicycle category")).thenAnswer((_)async=> Right(bicycleCategoryEntity));
          return reservationBloc;
        },
        act: (bloc)=>bloc.add(getBicycleCategory()),
        expect: ()=>[
          isA<LoadingState>(),
          isA<SuccessState>()
        ]
    );
    blocTest<ReservationBloc,ReservationStates>(
        'should emit [ReservationLoading,ReservationError] when data is gotten unsuccessfully"',
        build: (){
          when(mockGetBicycleCategoryUsecase.call("Get bicycle category")).thenAnswer((_)async=>Left(ConnectionFailure("Failed to connect to the network")));
          return reservationBloc;
        },
        act: (bloc)=>bloc.add(getBicycleCategory()),
        expect: ()=>[
          isA<LoadingState>(),
          isA<ErrorState>()
        ]
    );
  });



  BicycleByCategoryEntity bicycleByCategoryEntity=BicycleByCategoryEntity(
      message: "Get all categories",
      status: "ACCEPTED",
      localDateTime: DateTime(2000,12,1,19,26,50,2345),
      body:null
  );
  String category='Road_bikes';
  group('get bicycle by gategory', (){
    blocTest<ReservationBloc,ReservationStates>(
        'should emit [ReservationLoading,ReservationSuccess] when data is gotten successfully"',
        build: (){
          when(mockGetBicycleByCategoryUsecase.call(category)).thenAnswer((_)async=> Right(bicycleByCategoryEntity));
          return reservationBloc;
        },
        act: (bloc)=>bloc.add(getBicycleByCategory(category)),
        expect: ()=>[
          isA<LoadingState>(),
          isA<SuccessState>()
        ]
    );
    blocTest<ReservationBloc,ReservationStates>(
        'should emit [ReservationLoading,ReservationError] when data is gotten unsuccessfully"',
        build: (){
          when(mockGetBicycleByCategoryUsecase.call(category)).thenAnswer((_)async=>Left(ConnectionFailure("Failed to connect to the network")));
          return reservationBloc;
        },
        act: (bloc)=>bloc.add(getBicycleByCategory(category)),
        expect: ()=>[
          isA<LoadingState>(),
          isA<ErrorState>()
        ]
    );
  });



  HubContentEntity hubContentEntity=HubContentEntity(
      message: "Get all categories",
      status: "ACCEPTED",
      localDateTime: DateTime(2000,12,1,19,26,50,2345),
      body: null
  );
  int hubId=1;
  group('get hub content', (){
    blocTest<ReservationBloc,ReservationStates>(
        'should emit [ReservationLoading,ReservationSuccess] when data is gotten successfully"',
        build: (){
          when(mockGetHubContentUsecase.call(category, hubId)).thenAnswer((_)async=> Right(hubContentEntity));
          return reservationBloc;
        },
        act: (bloc)=>bloc.add(getHubContent(category, hubId)),
        expect: ()=>[
          isA<LoadingState>(),
          isA<SuccessState>()
        ]
    );
    blocTest<ReservationBloc,ReservationStates>(
        'should emit [ReservationLoading,ReservationError] when data is gotten unsuccessfully"',
        build: (){
          when(mockGetHubContentUsecase.call(category, hubId)).thenAnswer((_)async=>Left(ConnectionFailure("Failed to connect to the network")));
          return reservationBloc;
        },
        act: (bloc)=>bloc.add(getHubContent(category, hubId)),
        expect: ()=>[
          isA<LoadingState>(),
          isA<ErrorState>()
        ]
    );
  });


  BicycleDetailsEntity bicycleDetailsEntity=BicycleDetailsEntity(
      message: "Get all categories",
      status: "ACCEPTED",
      localDateTime: DateTime(2000,12,1,19,26,50,2345),
      body: null
  );
  int bicycleId=1;
  group('get bicycle detail', (){
    blocTest<ReservationBloc,ReservationStates>(
        'should emit [ReservationLoading,ReservationSuccess] when data is gotten successfully"',
        build: (){
          when(mockGetBicycleDetailsUsecase.call(bicycleId)).thenAnswer((_)async=> Right(bicycleDetailsEntity));
          return reservationBloc;
        },
        act: (bloc)=>bloc.add(getBicycleDetail(bicycleId)),
        expect: ()=>[
          isA<LoadingState>(),
          isA<SuccessState>()
        ]
    );
    blocTest<ReservationBloc,ReservationStates>(
        'should emit [ReservationLoading,ReservationError] when data is gotten unsuccessfully"',
        build: (){
          when(mockGetBicycleDetailsUsecase.call(bicycleId)).thenAnswer((_)async=>Left(ConnectionFailure("Failed to connect to the network")));
          return reservationBloc;
        },
        act: (bloc)=>bloc.add(getBicycleDetail(bicycleId)),
        expect: ()=>[
          isA<LoadingState>(),
          isA<ErrorState>()
        ]
    );
  });


  PhotoEntity photoEntity=PhotoEntity(
      message: "Get all categories",
      status: "ACCEPTED",
      localDateTime: DateTime(2000,12,1,19,26,50,2345),
      body: null
  );
  group('get photos', (){
    blocTest<ReservationPhotosBloc,ReservationStates>(
        'should emit [ReservationLoading,ReservationSuccess] when data is gotten successfully"',
        build: (){
          when(mockGetPhotoUsecase.call("Get photos")).thenAnswer((_)async=> Right(photoEntity));
          return reservationPhotosBloc;
        },
        act: (bloc)=>bloc.add(getPhotos()),
        expect: ()=>[
          isA<LoadingState>(),
          isA<SuccessState>()
        ]
    );
    blocTest<ReservationPhotosBloc,ReservationStates>(
        'should emit [ReservationLoading,ReservationError] when data is gotten unsuccessfully"',
        build: (){
          when(mockGetPhotoUsecase.call("Get photos")).thenAnswer((_)async=>Left(ConnectionFailure("Failed to connect to the network")));
          return reservationPhotosBloc;
        },
        act: (bloc)=>bloc.add(getPhotos()),
        expect: ()=>[
          isA<LoadingState>(),
          isA<ErrorState>()
        ]
    );
  });
}