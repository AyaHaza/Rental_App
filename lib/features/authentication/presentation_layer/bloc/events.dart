
abstract class AuthEvents{}

class RegisterEvent extends AuthEvents{
  var userEntity;
  RegisterEvent(this.userEntity);
}
class LoginEvent extends AuthEvents{
  var userEntity;
  LoginEvent(this.userEntity);
}
class RegisterWithGmailEvent extends AuthEvents{}
class RegisterWithFacebookEvent extends AuthEvents{}
class ProfileEvent extends AuthEvents{
  String username;
  ProfileEvent(this.username);
}
class AddProfileEvent extends AuthEvents{
  var userEntity;
  AddProfileEvent(this.userEntity);
}
class EditProfileEvent extends AuthEvents{
  var userEntity;
  EditProfileEvent(this.userEntity);
}