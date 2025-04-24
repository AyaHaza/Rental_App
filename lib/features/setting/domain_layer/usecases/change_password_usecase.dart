import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/password_entity.dart';
import '../repository/setting_repository.dart';


class ChangePasswordUsecase extends UseCse<Either<Failure, bool>,PasswordEntity> {
  SettingRepository settingRepository;
  ChangePasswordUsecase(
      this.settingRepository,
      );

  Future<Either<Failure, bool>> call(passwordEntity) async {
    return await settingRepository.changePassword(passwordEntity);
  }
}