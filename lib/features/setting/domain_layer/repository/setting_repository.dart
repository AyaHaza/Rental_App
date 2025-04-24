import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/policy_entity.dart';

abstract class SettingRepository{
  Future<Either<Failure, bool>> changePassword(passwordEntity);
  Future<Either<Failure, PolicyEntity>> GetPolicy();
  Future<Either<Failure, bool>> contactUs(contactUsEntity);
}