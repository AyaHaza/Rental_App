import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../repository/bicycle_repository.dart';

class DeleteBicycleSupaUsecase extends UseCse<Either<Failure, bool>,int> {
  BicycleRepository bicycleRepository;
  DeleteBicycleSupaUsecase(
      this.bicycleRepository,
      );

  Future<Either<Failure, bool>> call(id) async {
    return await bicycleRepository.deleteBicycleSupa(id);
  }
}