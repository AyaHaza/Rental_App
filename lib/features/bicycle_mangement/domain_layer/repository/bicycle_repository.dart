import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/bicycle_Supa_entity.dart';
import '../entities/bicycle_entity.dart';

abstract class BicycleRepository{
  Future<Either<Failure, bool>> addBicycleSupa(bicycleEntity);
  Future<Either<Failure, bool>> editBicycleSupa(id,bicycleEntity);
  Future<Either<Failure, List<BicycleEntity>>> getBicyles();
  Future<Either<Failure, List<BicycleSupaEntity>>> getBicylesSupa();
  Future<Either<Failure, bool>> deleteBicycleSupa(id);
}