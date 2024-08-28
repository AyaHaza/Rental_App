import 'package:rental_app/models/user_model.dart';
import '../../../models/user.dart';

abstract class AuthEvents{}

class RegisterEvent extends AuthEvents{
  UserModel userModel;
  RegisterEvent(this.userModel);
}
class LoginEvent extends AuthEvents{
  UserModelT userModel;
  LoginEvent(this.userModel);
}
class ProfileEvent extends AuthEvents{
  String username;
  ProfileEvent(this.username);
}
class EditProfileEvent extends AuthEvents{
  UserModel username;
  EditProfileEvent(this.username);
}
class RegisterWithGmailEvent extends AuthEvents{}
class RegisterWithFacebookEvent extends AuthEvents{}