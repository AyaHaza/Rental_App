import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/bicycle_by_category_entity.dart';
import '../entities/bicycle_category_entity.dart';
import '../entities/bicycle_details_entity.dart';
import '../entities/hub_content_entity.dart';
import '../entities/photo_entity.dart';

abstract class ReservationRepository{
  Future<Either<Failure, BicycleCategoryEntity>> getBicycleCategory();
  Future<Either<Failure, BicycleByCategoryEntity>> getBicycleByCategory(category);
  Future<Either<Failure, HubContentEntity>> getHubContent(category,hubId);
  Future<Either<Failure, BicycleDetailsEntity>> getdetails(bicycleId);
  Future<Either<Failure, PhotoEntity>> getPhotos();
}