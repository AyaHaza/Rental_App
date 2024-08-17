import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/photo_entity.dart';
import '../repository/reservation_repository.dart';


class GetPhotoUsecase extends UseCse<Either<Failure, PhotoEntity>,String> {
  ReservationRepository reservationRepository;
  GetPhotoUsecase(
      this.reservationRepository
      );

  Future<Either<Failure, PhotoEntity>> call(params) async {
    return await reservationRepository.getPhotos();
  }
}