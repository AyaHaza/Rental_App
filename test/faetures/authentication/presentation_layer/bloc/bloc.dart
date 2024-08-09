import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rental_clean_tdd/core/error/failure.dart';
import 'package:rental_clean_tdd/features/authentication/domain_layer/entities/user_login_entity.dart';
import 'package:rental_clean_tdd/features/authentication/domain_layer/entities/user_regiser_entity.dart';
import 'package:rental_clean_tdd/features/authentication/presentation_layer/bloc/bloc.dart';
import 'package:rental_clean_tdd/features/authentication/presentation_layer/bloc/events.dart';
import 'package:rental_clean_tdd/features/authentication/presentation_layer/bloc/states.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late MockSignUpUseCase mockSignUpUseCase;
  late MockSignInUseCase mockSignInUseCase;
  late AuthBloc authBloc;

  setUp((){
    mockSignUpUseCase=MockSignUpUseCase();
    mockSignInUseCase=MockSignInUseCase();
    authBloc=AuthBloc(mockSignUpUseCase, mockSignInUseCase);
  });

  UserRegisterEntity userRegisterEntity=UserRegisterEntity(
      firstName: 'hala',
      lastName: 'sadah',
      phone: '4790112833',
      birthDate: DateTime(2000,12,1),
      username: 'cscwvvw',
      password: 'aassqQQ12!!',
      confirmPassword: 'aassqQQ12!!'
  );

  UserLoginEntity userLoginEntity=UserLoginEntity(
    phone: '4790112833',
    password: 'aassqQQ12!!',
  );

  group("signup", (){
    blocTest<AuthBloc,AuthStates>(
        "should emit [AuthLoading,AuthSuccess] when data is gotten successfully",
        build: (){
          when(mockSignUpUseCase.call(userRegisterEntity)).thenAnswer((_)async=>Right(true));
          return authBloc;
        },
        act: (bloc)=>bloc.add(RegisterEvent(userRegisterEntity)),
        expect: ()=>[
          isA<LoadingState>(),
          isA<SuccessState>()
        ]
    );

    blocTest<AuthBloc,AuthStates>(
        "should emit [AuthLoading,AuthError] when data is gotten unsuccessfully",
        build: (){
          when(mockSignUpUseCase.call(userRegisterEntity)).thenAnswer((_)async=>Left(ServerFailure("server Failure")));
          return authBloc;
        },
        act: (bloc)=>bloc.add(RegisterEvent(userRegisterEntity)),
        expect: ()=>[
          isA<LoadingState>(),
          isA<ErrorState>()
        ]
    );
  });

  group("signup", (){
    blocTest<AuthBloc,AuthStates>(
        "should emit [AuthLoading,AuthSuccess] when data is gotten successfully",
        build: (){
          when(mockSignUpUseCase.call(userRegisterEntity)).thenAnswer((_)async=>Right(true));
          return authBloc;
        },
        act: (bloc)=>bloc.add(RegisterEvent(userRegisterEntity)),
        expect: ()=>[
          isA<LoadingState>(),
          isA<SuccessState>()
        ]
    );

    blocTest<AuthBloc,AuthStates>(
        "should emit [AuthLoading,AuthError] when data is gotten unsuccessfully",
        build: (){
          when(mockSignUpUseCase.call(userRegisterEntity)).thenAnswer((_)async=>Left(ServerFailure("server Failure")));
          return authBloc;
        },
        act: (bloc)=>bloc.add(RegisterEvent(userRegisterEntity)),
        expect: ()=>[
          isA<LoadingState>(),
          isA<ErrorState>()
        ]
    );
  });

  group("signin", (){
    blocTest<AuthBloc,AuthStates>(
        "should emit [AuthLoading,AuthSuccess] when data is gotten successfully",
        build: (){
          when(mockSignInUseCase.call(userLoginEntity)).thenAnswer((_)async=>Right(true));
          return authBloc;
        },
        act: (bloc)=>bloc.add(LoginEvent(userLoginEntity)),
        expect: ()=>[
          isA<LoadingState>(),
          isA<SuccessState>()
        ]
    );

    blocTest<AuthBloc,AuthStates>(
        "should emit [AuthLoading,AuthError] when data is gotten unsuccessfully",
        build: (){
          when(mockSignInUseCase.call(userLoginEntity)).thenAnswer((_)async=>Left(ServerFailure("server Failure")));
          return authBloc;
        },
        act: (bloc)=>bloc.add(LoginEvent(userLoginEntity)),
        expect: ()=>[
          isA<LoadingState>(),
          isA<ErrorState>()
        ]
    );
  });
}