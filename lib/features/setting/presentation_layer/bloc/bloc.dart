import 'package:bloc/bloc.dart';
import '../../domain_layer/usecases/change_password_usecase.dart';
import '../../domain_layer/usecases/contact_us_usecase.dart';
import '../../domain_layer/usecases/get_policy_usecase.dart';
import 'events.dart';
import 'states.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  ChangePasswordUsecase changePasswordUsecase;
  ContactUsUsecase contactUsUsecase;
  GetPolicyUsecase getPolicyUsecase;
  SettingBloc(this.contactUsUsecase,this.getPolicyUsecase,this.changePasswordUsecase) : super(SettingInitial()) {
    on<ChangePasswordEvent>((event, emit) async {
      emit(LoadingState());
      var result =
      await changePasswordUsecase.call(event.passwordEntity);
      result.fold((failure) {
        emit(ErrorState(failure.message));
      }, (data) {
        emit(SuccessState(data: data));
      });
    });

    on<GetPolicyEvent>((event, emit) async {
      emit(LoadingState());
      var result = await getPolicyUsecase.call('get');
      result.fold((failure) {
        emit(ErrorState(failure.message));
      }, (data) {
        emit(SuccessState(data: data));
      });
    });

    on<ContactusEvent>((event, emit) async {
      emit(LoadingState());
      var result = await contactUsUsecase.call(event.contactUsEntity);
      result.fold((failure) {
        emit(ErrorState(failure.message));
      }, (data) {
        emit(SuccessState(data: data));
      });
    });
  }
}
