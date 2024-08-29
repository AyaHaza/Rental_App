// ignore_for_file: avoid_print, non_constant_identifier_names
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../config/hive_config.dart';
import '../../../core/error/failure.dart';
import '../../../core/resources/variable.dart';
import '../../../core/service/core_service.dart';
import '../../../models/get_valide_code.dart';
import '../../../models/get_wallet_info.dart';

abstract class WalletService extends CoreService {
  Future<Either<Failure, bool>> createWallet(CreateWalletModel);
  Future<Either<Failure, bool>> editeWallet(AddMonyModel);
  Future<Either<Failure, GetWalletInfoModel>> getWalletInfo();
  Future<Either<Failure, AllvalidcodeModel>> getValidCode();
}

class WalletServiceImp extends WalletService {
  @override
  Future<Either<Failure, GetWalletInfoModel>> getWalletInfo() async {
    try {
      CoreService.responsee = await CoreService.dio.get(baseUrl + WalletInfo,
          options: Options(headers: {
            'accept': '*/*',
            'Authorization': 'Bearer ${userHive!.get("token")}'
          }));
      print(CoreService.responsee.statusCode);
      print("sssssssssssssssssssssssssssss");
      if (CoreService.responsee.statusCode == 200) {
        GetWalletInfoModel getWalletInfo =
            GetWalletInfoModel.fromJson(CoreService.responsee.data);
            print("yyyyyyyyyyyyyyyyyyyyyyyyy");
        print(getWalletInfo);
        return Right(getWalletInfo);
      } else {
        return left(ServerFailure(CoreService.responsee.data.toString()));
      }
    } on DioException catch (e) {
      return const Left(ConnectionFailure("An error in network"));
    }
  }

  @override
  Future<Either<Failure, bool>> createWallet(CreateWalletModel) async {
    try {
      print("55555555555555555555555");
      print(baseUrl + WalletInfo);
      // print(CoreService.responsee.statusCode);
      CoreService.responsee = await CoreService.dio.post(
          options: Options(headers: {
            'accept': '*/*',
            'Authorization': 'Bearer ${userHive!.get("token")}'
          }),
          baseUrl + WalletInfo,
          data: CreateWalletModel.toJson());
      print(CoreService.responsee.statusCode);
      return const Right(true);
    } on DioException catch (e) {
      print(e.response!.data["message"]);
      var msg = e.response!.data["message"];
      if (msg is List) {
        String temp = '';
        for (String s in msg) temp += s + '\n';
        return Left(ServerFailure(temp));
      } else if (msg is String) {
        return Left(ServerFailure(msg));
      } else {
        return const Left(ConnectionFailure("An error in network"));
      }
    }
  }

  @override
  Future<Either<Failure, AllvalidcodeModel>> getValidCode() async {
    try {
      CoreService.responsee = await CoreService.dio.get(
          baseUrl + WalletInfo + getAllvalidapi,
          options: Options(headers: {
            'accept': '*/*',
            'Authorization': 'Bearer ${userHive!.get("token")}'
          }));
      print(CoreService.responsee.statusCode);
      print("wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww");
      if (CoreService.responsee.statusCode == 200) {
        AllvalidcodeModel getValidCodeModel =
           AllvalidcodeModel.fromJson(CoreService.responsee.data);
            print("yyyyyyyyyyyyyyyyyyyyyyyyy");
        print(getValidCodeModel);
        return Right(getValidCodeModel);
      } else {
        return left(ServerFailure(CoreService.responsee.data.toString()));
      }
    } on DioException catch (e) {
      return const Left(ConnectionFailure("An error in network"));
    }
  }

  @override
  Future<Either<Failure, bool>> editeWallet(AddMonyModel) async {
    try {
      print(CoreService.responsee.statusCode);
      CoreService.responsee = await CoreService.dio.put(
          options: Options(headers: {
            'accept': '*/*',
            'Authorization': 'Bearer ${userHive!.get("token")}'
          }),
          baseUrl + WalletInfo,
          data: AddMonyModel.toJson());
      print(CoreService.responsee.statusCode);
      return const Right(true);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message.toString()));
   
    }
  }
}
