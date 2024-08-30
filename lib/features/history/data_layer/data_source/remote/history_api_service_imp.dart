import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import '../../../../../core/resources/variable.dart';
import '../../../domain_layer/entities/history_entity.dart';
import '../../models/history_model.dart';
import 'history_api_service.dart';

class HistoryApiServiceImp implements HistoryApiService{
  Dio dio;
  HistoryApiServiceImp(this.dio);
  @override
  Future<bool> addToHistorySupa(historyEntity) async{
    try{
      print(apiTableHistory);
      final _data = jsonEncode(HistoryModel.fromEntity(historyEntity));
      Response response=await dio.post(
          '${apiTableHistory}',
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
  Future<bool> deleteHistorySupa(id) async{
    try{
      print('${apiTableHistory}?id=eq.$id');
      Response response=await dio.delete(
          '${apiTableHistory}?id=eq.$id',
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
  Future<List<HistoryEntity>> getHistorySupa()async{
    try{
      print('${apiTableHistory}');
      Response responsee = await dio.get(
          '${apiTableHistory}?select=*',
          options: Options(
              headers: {
                'apikey': apikeySupa
              }
          )
      );
      print(responsee.statusCode);
      var allHistory=List.generate(responsee.data.length, (index) => HistoryModel.fromJson(responsee.data[index]));
      print(allHistory);
      return allHistory;
    }catch(e){
      print(e);
      throw SocketException("Failed to connect to the network");
    }
  }
}