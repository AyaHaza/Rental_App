import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:location/location.dart';
import '../../../config/hive_config.dart';
import '../../../core/error/failure.dart';
import '../../../core/resources/variable.dart';
import '../../../core/service/core_service.dart';
import '../../../models/hub_model.dart';


class MapService extends CoreService{

  Future<Either<Failure, LocationData>> getCurrentLocation()async{
    var location=Location();
    LocationData? currentLocation;
    try{
      var userLocation=await location.getLocation();
        currentLocation=userLocation;
        return Right(currentLocation);
    }catch(e){
      print(e);
      return Left(ConnectionFailure("An error in network"));
    }
  }


  Future<Either<Failure, List<Body>>> getHubs(currentLocation)async{
    try{
      CoreService.responsee =await CoreService.dio.get(
          '$baseUrl$getHubsApi?longtitude=36.278336&latitude=33.510414',
          // '$baseUrl$getHubsApi?longtitude=${currentLocation.longitude}&latitude=${currentLocation.latitude}',
        options: Options(
            headers: {
              'accept':'*/*',
              'Authorization': 'Bearer ${userHive!.get("token")}'
            }
        )
      );
      print(CoreService.responsee.statusCode);
      if(CoreService.responsee.statusCode==200){
        List<Body> hubs=List.generate(CoreService.responsee.data['body'].length, (index) => Body.fromJson(CoreService.responsee.data['body'][index]));
        print(hubs);
        return Right(hubs);
      }else{
        return Left(ServerFailure(CoreService.responsee.data.toString()));
      }
    }catch(e){
      print(e);
      return Left(ConnectionFailure("An error in network"));
    }
  }
}