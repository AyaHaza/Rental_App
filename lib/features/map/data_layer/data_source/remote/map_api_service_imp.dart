import 'dart:io';
import 'package:dio/dio.dart';
import 'package:location/location.dart';
import 'package:rental_clean_tdd/core/error/exception.dart';
import '../../../../../core/resources/variable.dart';
import '../../../domain_layer/entities/hubs_entity.dart';
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
            options: Options(
                headers: {
                  'accept':'*/*',
                  'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdHJpOTk5dHJpIiwiaWF0IjoxNzIzOTExMDA0LCJleHAiOjE3MjM5OTc0MDR9.QiuLOU9Sr9DIgDsgIvb48GAm0uiq5gDb6dA9POmuRIg'
                }
            )
        );
        print(responsee.statusCode);
        if(responsee.statusCode==200){
          var hubs=List.generate(responsee.data['body'].length, (index) => HubsModel.fromJson(responsee.data['body'][index]));
          print(hubs);
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


}