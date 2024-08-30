import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/user_regiser_entity.dart';
import '../repository/authentication_repository.dart';


class GetProfileSupaUsecase extends UseCse<Either<Failure, UserRegisterEntity>,String> {
  AuthenticationRepository authenticationPepositpory;
  GetProfileSupaUsecase(
      this.authenticationPepositpory,
      );

  Future<Either<Failure, UserRegisterEntity>> call(username) async {
    return await authenticationPepositpory.getprofileSupa(username);
  }
}