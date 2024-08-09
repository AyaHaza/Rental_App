
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