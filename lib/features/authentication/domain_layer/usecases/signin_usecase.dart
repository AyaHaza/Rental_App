import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/user_login_entity.dart';
import '../repository/authentication_repository.dart';


class SignInUseCase extends UseCse<Either<Failure, bool>,UserLoginEntity> {
  AuthenticationRepository authenticationPepositpory;
  SignInUseCase(
      this.authenticationPepositpory,
      );

  Future<Either<Failure, bool>> call(userEntity) async {
    return await authenticationPepositpory.signIn(userEntity);
  }
}