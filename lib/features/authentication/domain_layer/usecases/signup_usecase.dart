import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/user_regiser_entity.dart';
import '../repository/authentication_repository.dart';


class SignUpUseCase extends UseCse<Either<Failure, bool>,UserRegisterEntity> {
  AuthenticationRepository authenticationPepositpory;
  SignUpUseCase(
     this.authenticationPepositpory,
  );

  Future<Either<Failure, bool>> call(userEntity) async {
    return await authenticationPepositpory.signUp(userEntity);
  }
}