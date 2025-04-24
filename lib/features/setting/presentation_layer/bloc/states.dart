
abstract class SettingState {}

final class SettingInitial extends SettingState {}
class LoadingState extends SettingState {}
class ErrorState extends SettingState {
  String failure;
  ErrorState(this.failure);
}
class SuccessState extends SettingState {
  var data;
  SuccessState({
    required this.data,
  });
}