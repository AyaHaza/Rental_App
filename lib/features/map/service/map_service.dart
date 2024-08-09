import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_math/flutter_geo_math.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import '../../../config/hive_config.dart';
import '../../../core/error/failure.dart';
import '../../../core/resources/variable.dart';
import '../../../core/service/core_service.dart';
import '../../../models/hub_model.dart';
import '../../transport/view/select_transport.dart';


class MapService extends CoreService{

  Future<Either<Failure, LocationData>> getCurrentLocation()async{
    var location=Location();
    LocationData? currentLocation;
    try{
      var userLocation=await location.getLocation();
        currentLocation=userLocation;
        marker.add(
            Marker(point: LatLng(33.510414,36.278336), child: Icon(Icons.location_on,color: Colors.indigoAccent,size: 40,), width: 100,height: 100)
          // Marker(point: LatLng(userLocation.latitude!, userLocation.longitude!), child: Icon(Icons.location_on,color: Colors.indigoAccent,size: 40,), width: 80,height: 80)
        );
        return Right(currentLocation);
    }catch(e){
      print(e);
      return Left(ConnectionFailure("An error in network"));
    }
  }


  Future<Either<Failure, List<Body>>> getHubs(currentLocation,context)async{
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
       if(hubs.isNotEmpty){
         for(int i=0;i<hubs.length;i++){
           marker.add(Marker(point: LatLng(hubs[i].latitude, hubs[i].longitude), child: IconButton(icon:Icon(Icons.location_on,color: Colors.red,size: 40,),onPressed: (){
             Navigator.pushNamed(context,'/SelectTransport',arguments: SelectTransport(
                 hubId:hubs[i].id
             ),);
             print(hubs[i].id);
             FlutterMapMath flutterMapMath=FlutterMapMath();
             distance = flutterMapMath.distanceBetween(
                 33.510414,
                 36.27833,
                 hubs[i].latitude,
                 hubs[i].longitude,
                 "meters"
             );
             },),width: 80,height: 80));
         }
       }
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