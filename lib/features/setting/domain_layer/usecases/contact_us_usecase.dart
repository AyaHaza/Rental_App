import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/contact_us_entity.dart';
import '../repository/setting_repository.dart';


class ContactUsUsecase extends UseCse<Either<Failure, bool>,ContactUsEntity> {
  SettingRepository settingRepository;
  ContactUsUsecase(
      this.settingRepository,
      );

  Future<Either<Failure, bool>> call(contactUsEntity) async {
    return await settingRepository.contactUs(contactUsEntity);
  }
}