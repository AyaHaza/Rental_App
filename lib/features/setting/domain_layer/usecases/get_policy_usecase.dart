import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/policy_entity.dart';
import '../repository/setting_repository.dart';


class GetPolicyUsecase extends UseCse<Either<Failure, PolicyEntity>,String> {
  SettingRepository settingRepository;
  GetPolicyUsecase(
      this.settingRepository,
      );

  Future<Either<Failure, PolicyEntity>> call(string) async {
    return await settingRepository.GetPolicy();
  }
}