import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import '../../../config/hive_config.dart';
import '../../../core/error/failure.dart';
import '../../../core/resources/variable.dart';
import '../../../core/service/core_service.dart';
import '../../../main.dart';
import '../../../models/history_model.dart';
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
      // await supabase.auth.signUp(password: "password",email: "rrrrr@gmail.com");
      // print(supabase.auth.currentUser?.email);
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

  Future<Either<Failure, bool>> addHubsSupa(hubsModel) async{
    try{
      print(apiTableHubs);
      final _data =await json.encoder.convert(hubsModel);
      print(_data);
      CoreService.responsee=await CoreService.dio.post(
          '${apiTableHubs}',
          data: _data,
          options: Options(
              headers: {
                'apikey':apikeySupa
              }
          )
      );
      print(CoreService.responsee.statusCode);
      return Right(true);
    }catch(e){
      print(e);
      return Left(ConnectionFailure("An error in network"));
    }
  }

  Future<Either<Failure, bool>> editHubsSupa(id,hubsModel) async{
    try{
      final _data =await json.encoder.convert(hubsModel);
      print('${apiTableHubs}?name=eq.${hubsModel.name}');
      print(_data);
      CoreService.responsee=await CoreService.dio.patch(
          '${apiTableHubs}?id=eq.$id',
          data: _data,
          options: Options(
              headers: {
                'apikey':apikeySupa
              }
          )
      );
      print(CoreService.responsee.statusCode);
      return Right(true);
    }catch(e){
      print(e);
      return Left(ConnectionFailure("An error in network"));
    }
  }

  Future<Either<Failure, bool>> deleteHubsSupa(id) async{
    try{
      print('$apiTableHubs?id=eq.$id');
      CoreService.responsee=await CoreService.dio.delete(
          '${apiTableHubs}?id=eq.$id',
          options: Options(
              headers: {
                'apikey':apikeySupa
              }
          )
      );
      print(CoreService.responsee.statusCode);
      return Right(true);
    }catch(e){
      print(e);
      return Left(ConnectionFailure("An error in network"));
    }
  }

  Future<Either<Failure, List<Body>>> getHubsSupa() async{
    try{
      print(apiTableHubs);
      CoreService.responsee=await CoreService.dio.get(
          '${apiTableHubs}?select=*',
          options: Options(
              headers: {
                'apikey':apikeySupa
              }
          )
      );
      print(CoreService.responsee.statusCode);
      var allHubs=List.generate(CoreService.responsee.data.length, (index) => Body.fromJson(CoreService.responsee.data[index]));
      print(allHubs);

      return Right(allHubs);
    }catch(e){
      print(e);
      return Left(ConnectionFailure("An error in network"));
    }
  }

  Future<Either<Failure,List<LatLng>>> showPath(start, destination)async{
    print(start);
    print("object");
    print(destination);
    final response= await CoreService.dio.get(
      'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$apiKey&start=${start.longitude},${start.latitude}&end=${destination.longitude},${destination.latitude}',
    );
    if(response.statusCode==200){
      final data=response.data;
      final List<dynamic> coords = data['features'][0]['geometry']['coordinates'];
      List<LatLng> routePoints=coords.map((coord)=>LatLng(coord[1], coord[0])).toList();
      print(routePoints);
        return Right(routePoints);
    }else{
      return Left(ConnectionFailure("An error in network"));
    }
  }

  //history
  Future<Either<Failure, List<HistoryModel>>> getHistorySupa() async{
    try{
      print(apiTableHistory);
      CoreService.responsee=await CoreService.dio.get(
          '${apiTableHistory}?select=*',
          options: Options(
              headers: {
                'apikey':apikeySupa
              }
          )
      );
      print(CoreService.responsee.statusCode);
      var allHistory=List.generate(CoreService.responsee.data.length, (index) => HistoryModel.fromJson(CoreService.responsee.data[index]));
      print(allHistory);

      return Right(allHistory);
    }catch(e){
      print(e);
      return Left(ConnectionFailure("An error in network"));
    }
  }

  Future<Either<Failure, bool>> addToHistorySupa(historyModel) async{
    try{
      print(apiTableHistory);
      CoreService.responsee=await CoreService.dio.post(
          '${apiTableHistory}?select=*',
          data: historyModel.toJson(),
          options: Options(
              headers: {
                'apikey':apikeySupa
              }
          )
      );
      print(CoreService.responsee.statusCode);


      return Right(true);
    }catch(e){
      print(e);
      return Left(ConnectionFailure("An error in network"));
    }
  }

  Future<Either<Failure, bool>> deleteHistorySupa(id) async{
    try{
      print('$apiTableHistory?id=eq.$id');
      CoreService.responsee=await CoreService.dio.delete(
          '${apiTableHistory}?id=eq.$id',
          options: Options(
              headers: {
                'apikey':apikeySupa
              }
          )
      );
      print(CoreService.responsee.statusCode);
      return Right(true);
    }catch(e){
      print(e);
      return Left(ConnectionFailure("An error in network"));
    }
  }
}