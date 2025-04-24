
import '../../../domain_layer/entities/policy_entity.dart';

abstract class SettingApiService{
  Future<bool> changePassword(passwordEntity);
  Future<PolicyEntity> GetPolicy();
  Future<bool> contactUs(contactUsEntity);
}