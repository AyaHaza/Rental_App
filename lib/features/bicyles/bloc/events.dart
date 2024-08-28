
import 'package:rental_app/models/bicycle_Supa_model.dart';

abstract class BicycleEvents{}

class GetBicycleEvent extends BicycleEvents{}
class DeleteBicycleSupa extends BicycleEvents{
  int id;
  DeleteBicycleSupa(this.id);
}
class AddBicycleSupa extends BicycleEvents{
  BicycleSupaModel bicycleSupaModel;
  AddBicycleSupa(this.bicycleSupaModel);
}
class EditBicycleSupa extends BicycleEvents{
  int id;
  BicycleSupaModel bicycleSupaModel;
  EditBicycleSupa(this.id,this.bicycleSupaModel);
}