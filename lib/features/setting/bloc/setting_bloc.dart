import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rental_app/models/contactus_model.dart';
import '../../../models/changePassword_model.dart';
import '../service/setting_service.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingInitial()) {
    on<ChangePasswordEvent>((event, emit) async {
      emit(LoadingState());
      var result =
          await SettingServiceImp().changePassword(event.changePasswordModel);
      result.fold((failure) {
        emit(ErrorState(failure.message));
      }, (data) {
        emit(SuccessState(data: data));
      });
    });

    on<GetPolicyEvent>((event, emit) async {
      emit(LoadingState());
      var result = await SettingServiceImp().GetPolicy();
      result.fold((failure) {
        emit(ErrorState(failure.message));
      }, (data) {
        emit(SuccessState(data: data));
      });
    });

    on<ContactusEvent>((event, emit) async {
      emit(LoadingState());
      var result = await SettingServiceImp().contactUs(event.contactUsModel);
      result.fold((failure) {
        emit(ErrorState(failure.message));
      }, (data) {
        emit(SuccessState(data: data));
      });
    });
  }
}
