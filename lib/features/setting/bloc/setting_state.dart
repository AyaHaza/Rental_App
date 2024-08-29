part of 'setting_bloc.dart';

sealed class SettingState extends Equatable {
  const SettingState();
  
  @override
  List<Object> get props => [];
}

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