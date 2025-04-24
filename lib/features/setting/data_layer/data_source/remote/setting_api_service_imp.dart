

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rental_clean_tdd/features/setting/domain_layer/entities/policy_entity.dart';

import '../../../../../config/hive_config.dart';
import '../../../../../core/error/exception.dart';
import '../../../../../core/resources/variable.dart';
import '../../models/contact_us_model.dart';
import '../../models/password_model.dart';
import '../../models/policy_model.dart';
import 'setting_api_service.dart';

class SettingApiServiceImp implements SettingApiService{
  Dio dio;
  SettingApiServiceImp(this.dio);
  @override
  Future<PolicyEntity> GetPolicy()async {
    try {
      Response responsee = await dio.get(
          baseUrl+policyApi,
          options: Options(headers: {
            'accept': '*/*',
            'Authorization': 'Bearer ${userHive!.get("token")}'
          }));
      print(responsee.statusCode);
      if (responsee.statusCode == 200) {
        var getPolicy =
        PolicyModel.fromJson(responsee.data);
        print(getPolicy);
        return getPolicy;
      } else {
        throw ServerException(responsee.data.toString());
      }
    }catch (e) {
      throw SocketException("Failed to connect to the network");
    }
  }

  @override
  Future<bool> changePassword(passwordEntity)async {
    try {
      final _data = jsonEncode(PasswordModel.fromJson(passwordEntity));
      Response responsee = await dio.put(
          baseUrl+changePasswordApi,
          options: Options(headers: {
            'accept': '*/*',
            'Authorization': 'Bearer ${userHive!.get("token")}'
          }),
          data: _data);
      print(responsee.statusCode);
      return true;
    } on DioException catch (e) {
      throw ServerException(e.message.toString());
    }
  }

  @override
  Future<bool> contactUs(contactUsEntity) async{
    try {
      final _data = jsonEncode(ContactUsModel.fromJson(contactUsEntity));
      print(contactusApi);
      Response responsee = await dio.post(
          contactusApi,
          options: Options(headers: {
            'apiKey' :apikeySupa
          }),
          data: _data
      );
      print(responsee.statusCode);
      return true;
    }on DioException catch (e) {
      throw ServerException(e.message.toString());
    }
  }

}