import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:rental_app/models/history_model.dart';

import '../../../models/hubModel_supa.dart';
import '../../../models/hub_model.dart';

abstract class MapEvents{}


class GetHubs extends MapEvents{
  LocationData currentLocation;
  GetHubs(this.currentLocation);
}

class GetHubsSupa extends MapEvents{}

class DeleteHubsSupa extends MapEvents{
  int id;
  DeleteHubsSupa(this.id);
}

class AddHubsSupa extends MapEvents{
  BodyHubsSupa hubsModel;
  AddHubsSupa(this.hubsModel);
}

class EditHubsSupa extends MapEvents{
  int id;
  BodyHubsSupa hubsModel;
  EditHubsSupa(this.id,this.hubsModel);
}

class GetLocation extends MapEvents{
}

class ShowPath extends MapEvents{
  LatLng start;
  LatLng destination;
  ShowPath(this.start,this.destination);
}

class AddToHistory extends MapEvents{
  HistoryModel historyModel;
  AddToHistory(this.historyModel);
}

class GetHistory extends MapEvents{
}

class DeleteHistory extends MapEvents{
  int id;
  DeleteHistory(this.id);
}

class AddToList extends MapEvents{
  List data;
  AddToList(this.data);
}
class GetList extends MapEvents{
}