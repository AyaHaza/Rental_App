// ignore_for_file: non_constant_identifier_names
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../config/hive_config.dart';
import '../../../core/error/failure.dart';
import '../../../core/resources/variable.dart';
import '../../../core/service/core_service.dart';
import '../../../models/contactus_model.dart';
import '../../../models/getPolicy.dart';
import '../../../models/changePassword_model.dart';

abstract class SettingService extends CoreService {
  Future<Either<Failure, bool>> changePassword(ChangePasswordModel changePassword);
  Future<Either<Failure, GetPolicyModel>> GetPolicy();
Future<Either<Failure, bool>> contactUs(ContactUsModel contactUs);

}

class SettingServiceImp extends SettingService {
  @override
  Future<Either<Failure, bool>> changePassword(ChangePasswordModel changePassword) async {
    try {
      print(userHive!.get("token"));
      print("nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn");
      CoreService.responsee = await CoreService.dio.put(
          options: Options(headers: {
            'accept': '*/*',
            'Authorization': 'Bearer ${userHive!.get("token")}'
          }),
          baseUrl + changePasswordApi,
          data: changePassword.toJson());
      print(CoreService.responsee.statusCode);
      return const Right(true);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message.toString()));
    }
  }
  
  @override
  Future<Either<Failure, GetPolicyModel>> GetPolicy()async {
   try {
      CoreService.responsee = await CoreService.dio.get(baseUrl + policyApi,
          options: Options(headers: {
            'accept': '*/*',
            'Authorization': 'Bearer ${userHive!.get("token")}'
          }));
      print(CoreService.responsee.statusCode);
      if (CoreService.responsee.statusCode == 200) {
        GetPolicyModel getPolicy =
            GetPolicyModel.fromJson(CoreService.responsee.data);
        print(getPolicy);
        return Right(getPolicy);
      } else {
        return left(ServerFailure(CoreService.responsee.data.toString()));
      }
    } on DioException catch (e) {
      return const Left(ConnectionFailure("An error in network"));
    }
  }
  
  @override
  Future<Either<Failure, bool>> contactUs(ContactUsModel contactUs) async{
 try {
      
      print("cccccccccccccccccccccccccccccc");
      CoreService.responsee = await CoreService.dio.post(
          options: Options(headers: {
           apiKey :apikeySupa
          }),
          contactusApi,
          data: contactUs.toJson());
      print(CoreService.responsee.statusCode);
      return const Right(true);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message.toString()));
    }
  }
}
