import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/bicycle_details_entity.dart';
import '../repository/reservation_repository.dart';


class GetBicycleDetailsUsecase extends UseCse<Either<Failure, BicycleDetailsEntity>,int> {
  ReservationRepository reservationRepository;
  GetBicycleDetailsUsecase(
      this.reservationRepository
      );

  Future<Either<Failure, BicycleDetailsEntity>> call(bicycleId) async {
    return await reservationRepository.getdetails(bicycleId);
  }
}