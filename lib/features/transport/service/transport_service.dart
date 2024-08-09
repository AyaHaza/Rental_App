import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../config/hive_config.dart';
import '../../../core/error/failure.dart';
import '../../../core/resources/variable.dart';
import '../../../core/service/core_service.dart';
import '../../../models/bicycle_by_category_model.dart';
import '../../../models/bicycle_category_model.dart';
import '../../../models/bicycle_details.dart';
import '../../../models/hub_content_model.dart';

class TransportService extends CoreService{

  Future<Either<Failure, BicycleCategoryModel>> getBicycleCategory()async{
    try{
      print(baseUrl+getBicycleCategoryApi);
      CoreService.responsee =await CoreService.dio.get(
          baseUrl+getBicycleCategoryApi,
          options: Options(
              headers: {
                'accept':'*/*',
                'Authorization': 'Bearer ${userHive!.get("token")}'
              }
          )
      );
      print(CoreService.responsee.statusCode);
      if(CoreService.responsee.statusCode==200){
        BicycleCategoryModel getBicycle=BicycleCategoryModel.fromJson(CoreService.responsee.data);
        print(getBicycle);
        return Right(getBicycle);
      }else{
        return Left(ServerFailure(CoreService.responsee.data.toString()));
      }
    }on DioException catch (e) {
        return const Left(ConnectionFailure("An error in network"));
    }
  }


  Future<Either<Failure, BicycleByCategoryModel>> getBicycleByCategory(category)async{
    try{
      print('$baseUrl$getBicycleByCategoryApi?category=$category');
      CoreService.responsee =await CoreService.dio.get(
          '$baseUrl$getBicycleByCategoryApi?category=$category',
          options: Options(
              headers: {
                'accept':'*/*',
                'Authorization': 'Bearer ${userHive!.get("token")}'
              }
          )
      );
      print(CoreService.responsee.statusCode);
      if(CoreService.responsee.statusCode==200){
        BicycleByCategoryModel getByBicycle=BicycleByCategoryModel.fromJson(CoreService.responsee.data);
        print(getByBicycle);
        return Right(getByBicycle);
      }else{
        return Left(ServerFailure(CoreService.responsee.data.toString()));
      }
    }on DioException catch (e) {
      return const Left(ConnectionFailure("An error in network"));
    }
  }


  Future<Either<Failure, HubContentModel>> getHubContent(category,hubId)async{
    try{
      print('$baseUrl$getHubContentApi/$hubId?bicycleCategory=$category');
      CoreService.responsee =await CoreService.dio.get(
          '$baseUrl$getHubContentApi/$hubId?bicycleCategory=$category',
          options: Options(
              headers: {
                'accept':'*/*',
                'Authorization': 'Bearer ${userHive!.get("token")}'
              }
          )
      );
      print(CoreService.responsee.statusCode);
      if(CoreService.responsee.statusCode==200){
        HubContentModel getHubContent=HubContentModel.fromJson(CoreService.responsee.data);
        print(getHubContent);
        return Right(getHubContent);
      }else{
        return Left(ServerFailure(CoreService.responsee.data.toString()));
      }
    }on DioException catch (e) {
      return const Left(ConnectionFailure("An error in network"));
    }
  }


  Future<Either<Failure, BicycleDetailsModel>> getdetails(bicycleId)async{
    try{
      print('$baseUrl$getBicycleDetailsApi/$bicycleId');
      CoreService.responsee =await CoreService.dio.get(
          '$baseUrl$getBicycleDetailsApi/$bicycleId',
          options: Options(
              headers: {
                'accept':'*/*',
                'Authorization': 'Bearer ${userHive!.get("token")}'
              }
          )
      );
      print(CoreService.responsee.statusCode);
      if(CoreService.responsee.statusCode==200){
        BicycleDetailsModel getBicycleDetail=BicycleDetailsModel.fromJson(CoreService.responsee.data);
        print(getBicycleDetail);
        return Right(getBicycleDetail);
      }else{
        return Left(ServerFailure(CoreService.responsee.data.toString()));
      }
    }on DioException catch (e) {
      return const Left(ConnectionFailure("An error in network"));
    }
  }

}