import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/bicycle_category_entity.dart';
import '../repository/reservation_repository.dart';


class GetBicycleCategoryUsecase extends UseCse<Either<Failure, BicycleCategoryEntity>,String> {
  ReservationRepository reservationRepository;
  GetBicycleCategoryUsecase(
      this.reservationRepository
      );

  Future<Either<Failure, BicycleCategoryEntity>> call(params) async {
    return await reservationRepository.getBicycleCategory();
  }
}