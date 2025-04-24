
import '../../domain_layer/entities/contact_us_entity.dart';
import '../../domain_layer/entities/password_entity.dart';

abstract class SettingEvent {}

class ChangePasswordEvent extends SettingEvent {
  PasswordEntity passwordEntity;
  ChangePasswordEvent(this.passwordEntity);
}

class ContactusEvent extends SettingEvent {
  ContactUsEntity contactUsEntity;
  ContactusEvent({
    required this.contactUsEntity,
  });
}
class GetPolicyEvent extends SettingEvent{}
