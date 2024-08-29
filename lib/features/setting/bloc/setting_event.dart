// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'setting_bloc.dart';

sealed class SettingEvent extends Equatable {
  const SettingEvent();

  @override
  List<Object> get props => [];
}

class ChangePasswordEvent extends SettingEvent {
  ChangePasswordModel changePasswordModel;
  ChangePasswordEvent(this.changePasswordModel);
}

class ContactusEvent extends SettingEvent {
  ContactUsModel contactUsModel;
  ContactusEvent({
    required this.contactUsModel,
  });
}
class GetPolicyEvent extends SettingEvent{}
