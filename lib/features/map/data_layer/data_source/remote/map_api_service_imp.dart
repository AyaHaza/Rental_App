import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:rental_clean_tdd/core/error/exception.dart';
import 'package:rental_clean_tdd/features/history/domain_layer/entities/history_entity.dart';
import '../../../../../config/hive_config.dart';
import '../../../../../core/resources/variable.dart';
import '../../../domain_layer/entities/hubs_entity.dart';
import '../../../../history/data_layer/models/history_model.dart';
import '../../models/hubs_model.dart';
import 'map_api_service.dart';


class MapApiServiceImp implements MapApiService{
  Dio dio;
  MapApiServiceImp(this.dio);

  @override
  Future<LocationData> getCurrentLocation()async{
      var location=Location();
      LocationData? currentLocation;
      try{
        var userLocation=await location.getLocation();
        print(currentLocation);
        currentLocation=userLocation;
        return currentLocation;
      }on DioException catch(e){
        print(e);
        throw DioException(requestOptions: RequestOptions());
      }
    }

  @override
  Future<List<HubsEntity>> getHubs(currentLocation)async{
      try{
        print(baseUrl+getHubsApi);
        Response responsee =await dio.get(
            '$baseUrl$getHubsApi?longtitude=36.278336&latitude=33.510414',
            // '$baseUrl$getHubsApi?longtitude=${currentLocation.longitude}&latitude=${currentLocation.latitude}',
            options:(userHive==null)?Options(
                headers: {
                  'accept':'*/*',
                  'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMjIyODg3NzkxIiwiaWF0IjoxNzI0ODczODIxLCJleHAiOjE3MjQ5NjAyMjF9'
                }
            ):Options(
                headers: {
                  'accept':'*/*',
                  'Authorization':'Bearer ${userHive!.get("token")}'
                }
            )
        );
        print(responsee.statusCode);
        if(responsee.statusCode==200){
          var hubs=List.generate(responsee.data['body'].length, (index) => HubsModel.fromJson(responsee.data['body'][index]));
          return hubs;
        }else{
          throw ServerException(responsee.data.toString());
        }
      }on DioException catch(e){
        if(e.response !=null){
          throw SocketException(e.response!.data.toString());
        }else{
          throw SocketException("Failed to connect to the network");
        }
      }
    }

  @override
  Future<bool> addHubsSupa(hubsEntity) async{
    try{
      print(apiTableHubs);
      final _data = jsonEncode(HubsModel.fromEntity(hubsEntity));
      Response response=await dio.post(
          '${apiTableHubs}',
          data: _data,
          options: Options(
              headers: {
                'apikey':apikeySupa
              }
          )
      );
      print(response.statusCode);
      return true;
    }catch(e){
      print(e);
      throw SocketException("Failed to connect to the network");
    }
  }

  @override
  Future<bool> deleteHubsSupa(id) async{
    try{
      print('${apiTableHubs}?id=eq.$id');
      Response response=await dio.delete(
          '${apiTableHubs}?id=eq.$id',
          options: Options(
              headers: {
                'apikey':apikeySupa
              }
          )
      );
      print(response.statusCode);
      return true;
    }catch(e){
      print(e);
      throw SocketException("Failed to connect to the network");
    }
  }

  @override
  Future<bool> editHubsSupa(id, hubsEntity) async{
    try{
      print('${apiTableHubs}?id=eq.$id');
      final _data = jsonEncode(HubsModel.fromEntity(hubsEntity));
      Response response=await dio.patch(
          '${apiTableHubs}?id=eq.$id',
          data: _data,
          options: Options(
              headers: {
                'apikey':apikeySupa
              }
          )
      );
      print(response.statusCode);
      return true;
    }catch(e){
      print(e);
      throw SocketException("Failed to connect to the network");
    }
  }

  @override
  Future<List<HubsEntity>> getHubsSupa()async{
    try{
      print('${apiTableHubs}');
      Response responsee = await dio.get(
          '${apiTableHubs}?select=*',
          options: Options(
              headers: {
                'apikey': apikeySupa
              }
          )
      );
      print(responsee.statusCode);
      var allHubsSupa = List.generate(responsee.data.length, (index) => HubsModel.fromJson(responsee.data[index]));
      print(allHubsSupa);
      return allHubsSupa;
    }catch(e){
      print(e);
      throw SocketException("Failed to connect to the network");
    }
  }

  @override
  Future<List<LatLng>> showPath(start, destination)async{
    try{
      Response response=await dio.get(
        'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$apiKey&start=${start.longitude},${start.latitude}&end=${destination.longitude},${destination.latitude}',
      );
      print(response.statusCode);
      final data=response.data;
      final List<dynamic> coords = data['features'][0]['geometry']['coordinates'];
      List<LatLng> routePoints=coords.map((coord)=>LatLng(coord[1], coord[0])).toList();
      return routePoints;
    }catch(e){
      print(e);
      throw SocketException("Failed to connect to the network");
    }
  }


}