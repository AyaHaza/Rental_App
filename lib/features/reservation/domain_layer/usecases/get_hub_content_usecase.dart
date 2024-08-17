import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/hub_content_entity.dart';
import '../repository/reservation_repository.dart';


class GetHubContentUsecase extends UseCseWithTwoParams<Either<Failure, HubContentEntity>,String,int> {
  ReservationRepository reservationRepository;
  GetHubContentUsecase(
      this.reservationRepository
      );

  Future<Either<Failure, HubContentEntity>> call(category, hubId) async {
    return await reservationRepository.getHubContent(category, hubId);
  }
}