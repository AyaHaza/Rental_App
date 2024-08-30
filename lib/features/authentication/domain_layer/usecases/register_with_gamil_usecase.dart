import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../repository/authentication_repository.dart';


class RegisterWithGamilUsecase extends UseCse<Either<Failure, bool>,String> {
  AuthenticationRepository authenticationPepositpory;
  RegisterWithGamilUsecase(
      this.authenticationPepositpory,
      );

  Future<Either<Failure, bool>> call(string) async {
    return await authenticationPepositpory.registerWithGamil();
  }
}