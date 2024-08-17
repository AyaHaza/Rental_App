import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/bicycle_by_category_entity.dart';
import '../repository/reservation_repository.dart';


class GetBicycleByCategoryUsecase extends UseCse<Either<Failure, BicycleByCategoryEntity>,String> {
  ReservationRepository reservationRepository;
  GetBicycleByCategoryUsecase(
      this.reservationRepository
      );

  Future<Either<Failure, BicycleByCategoryEntity>> call(category) async {
    return await reservationRepository.getBicycleByCategory(category);
  }
}