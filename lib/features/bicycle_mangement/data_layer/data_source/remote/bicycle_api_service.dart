import '../../../domain_layer/entities/bicycle_Supa_entity.dart';
import '../../../domain_layer/entities/bicycle_entity.dart';

abstract class BicycleApiService{
  Future<bool> addBicycleSupa(bicycleEntity);
  Future<bool> editBicycleSupa(id,bicycleEntity);
  Future<List<BicycleEntity>> getBicyles();
  Future<List<BicycleSupaEntity>> getBicylesSupa();
  Future<bool> deleteBicycleSupa(id);
}