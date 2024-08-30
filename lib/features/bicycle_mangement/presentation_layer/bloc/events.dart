
import '../../domain_layer/entities/bicycle_Supa_entity.dart';

abstract class BicycleEvents{}

class GetBicycleEvent extends BicycleEvents{}
class DeleteBicycleSupa extends BicycleEvents{
  int id;
  DeleteBicycleSupa(this.id);
}
class AddBicycleSupa extends BicycleEvents{
  BicycleSupaEntity bicycleSupaEntity;
  AddBicycleSupa(this.bicycleSupaEntity);
}
class EditBicycleSupa extends BicycleEvents{
  int id;
  BicycleSupaEntity bicycleSupaEntity;
  EditBicycleSupa(this.id,this.bicycleSupaEntity);
}