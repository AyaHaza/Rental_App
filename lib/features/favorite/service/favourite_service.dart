import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../config/hive_config.dart';
import '../../../core/error/failure.dart';
import '../../../core/resources/variable.dart';
import '../../../core/service/core_service.dart';
import '../../../models/favourite_model.dart';
import '../../../models/post_favourite_model.dart';

abstract class FavouriteService extends CoreService {
  Future<Either<Failure, FavouriteModel>> getFavouriteItemforUser(bicycleId);
  Future<Either<Failure, bool>> addNewFavouriteItem(
      PostFavouriteModel PostFavouriteModel, bicycleId);
  Future<Either<Failure, bool>> deleteFavouriteItem(id);
}

class FavouriteServiceImp extends FavouriteService {
  @override
  Future<Either<Failure, FavouriteModel>> getFavouriteItemforUser(
      bicycleId) async {
    try {
      CoreService.responsee = await CoreService.dio.get(
          '$baseUrl$favourite_biclesApi/$by_faourite_idApi/$bicycleId',
          options: Options(headers: {
            'accept': '*/*',
            'Authorization': 'Bearer ${userHive!.get("token")}'
          }));
      print(CoreService.responsee.statusCode);
      if (CoreService.responsee.statusCode == 200) {
        FavouriteModel favouriteModel =
            FavouriteModel.fromJson(CoreService.responsee.data);
        print(favouriteModel);
        return Right(favouriteModel);
      } else {
        return left(ServerFailure(CoreService.responsee.data.toString()));
      }
    } on DioException catch (e) {
      return const Left(ConnectionFailure("An error in network"));
    }
  }

  @override
  Future<Either<Failure, bool>> addNewFavouriteItem(
      PostFavouriteModel PostFavouriteModel, bicycleId) async {
    try {
      print(CoreService.responsee.statusCode);
      CoreService.responsee = await CoreService.dio.put(
          options: Options(headers: {
            'accept': '*/*',
            'Authorization': 'Bearer ${userHive!.get("token")}'
          }),
          "$baseUrl$favourite_biclesApi",
          data: PostFavouriteModel.toJson());
      print(CoreService.responsee.statusCode);
      return const Right(true);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteFavouriteItem(id) async {
    try {
      print(CoreService.responsee.statusCode);
      CoreService.responsee = await CoreService.dio.delete(
        options: Options(headers: {
          'accept': '*/*',
          'Authorization': 'Bearer ${userHive!.get("token")}'
        }),
        "$baseUrl$favourite_biclesApi/$id",
      );
      //! هون شو لازم ينحط طالما ديليت
      print(CoreService.responsee.statusCode);
      return const Right(true);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message.toString()));
    }
  }
}
