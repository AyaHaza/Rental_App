import '../../../domain_layer/entities/bicycle_by_category_entity.dart';
import '../../../domain_layer/entities/bicycle_category_entity.dart';
import '../../../domain_layer/entities/bicycle_details_entity.dart';
import '../../../domain_layer/entities/hub_content_entity.dart';
import '../../../domain_layer/entities/photo_entity.dart';

abstract class ReservationApiService{
  Future<BicycleCategoryEntity> getBicycleCategory();
  Future<BicycleByCategoryEntity> getBicycleByCategory(category);
  Future<HubContentEntity> getHubContent(category,hubId);
  Future<BicycleDetailsEntity> getdetails(bicycleId);
  Future<PhotoEntity> getPhotos();
}