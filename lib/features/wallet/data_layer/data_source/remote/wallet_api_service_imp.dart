
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import '../../../../../config/hive_config.dart';
import '../../../../../core/error/exception.dart';
import '../../../../../core/resources/variable.dart';
import '../../../domain_layer/entities/wallet_info_entity.dart';
import '../../../domain_layer/entities/wallet_valid_code_entity.dart';
import '../../models/balance_model.dart';
import '../../models/wallet_info_model.dart';
import '../../models/wallet_model.dart';
import '../../models/wallet_valid_code_model.dart';
import 'wallet_api_service.dart';

class WalletApiServiceImp implements WalletApiService{
  Dio dio;
  WalletApiServiceImp(this.dio);
  @override
  Future<bool> createWallet(walletEntity)async {
    try {
      print(baseUrl + WalletInfo);
      final _data = jsonEncode(WalletModel.fromEntity(walletEntity));
      Response responsee = await dio.post(
          baseUrl + WalletInfo,
          data: _data,
          options: Options(headers: {
            'accept': '*/*',
            'Authorization': 'Bearer ${userHive!.get("token")}'
          }),
       );
      print(responsee.statusCode);
      userHive!.put('haveWallet', 'yes');
      return true;
    } on DioException catch (e) {
      print(e.response!.data["message"]);
      var msg = e.response!.data["message"];
      if (msg is List) {
        String temp = '';
        for (String s in msg) temp += s + '\n';
        throw ServerException(temp);
      } else if (msg is String) {
        throw ServerException(msg);
      } else {
        throw SocketException("Failed to connect to the network");
      }
    }
  }

  @override
  Future<WalletValidCodeEntity> getValidCode()async {
    try {
      Response responsee = await dio.get(
          baseUrl + WalletInfo + getAllvalidapi,
          options: Options(headers: {
            'accept': '*/*',
            'Authorization': 'Bearer ${userHive!.get("token")}'
          }));
      print(responsee.statusCode);
      if (responsee.statusCode == 200) {
        var getValidCodeModel = WalletValidCodeModel.fromJson(responsee.data);
        print(getValidCodeModel);
        return getValidCodeModel;
      } else {
        throw ServerException(responsee.data.toString());
      }
    }catch (e) {
      throw SocketException("Failed to connect to the network");
    }
  }

  @override
  Future<WalletInfoEntity> getWalletInfo() async {
    try {
      Response responsee = await dio.get(
          baseUrl + WalletInfo,
          options: Options(headers: {
            'accept': '*/*',
            'Authorization': 'Bearer ${userHive!.get("token")}'
          }));
      print(responsee.statusCode);
      if (responsee.statusCode == 200) {
        var getWalletInfo = WalletInfoModel.fromJson(responsee.data);
        print(getWalletInfo);
        return getWalletInfo;
      } else {
        throw ServerException(responsee.data.toString());
      }
    }catch (e) {
      throw SocketException("Failed to connect to the network");
    }
  }

  @override
  Future<bool> addMoneyToWallet(balanceEntity) async {
    try {
      final _data = jsonEncode(BalanceModel.fromEntity(balanceEntity));
      Response responsee = await dio.put(
          baseUrl + WalletInfo,
          options: Options(headers: {
            'accept': '*/*',
            'Authorization': 'Bearer ${userHive!.get("token")}'
          }),
          data: _data
      );
      print(responsee.statusCode);
      return true;
    } catch (e) {
      throw SocketException("Failed to connect to the network");
    }
  }
  
}