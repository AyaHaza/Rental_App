import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/add_mony_model.dart';
import '../../../models/create_wallet_model.dart';
import '../../../models/get_valide_code.dart';
import '../service/wallet_service.dart';
part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  WalletBloc() : super(WalletInitial()) {
    on<GetWalletInfo>((event, emit) async {
      emit(LoadingState());
      var result = await WalletServiceImp().getWalletInfo();
      result.fold((failure) {
        emit(ErrorState(failure.message));
      }, (data) {
        emit(SuccessState(data: data));
      });
    });

    on<GetAllvalidCodeEvent>((event, emit) async {
      emit(LoadingState());
      var result = await WalletServiceImp().getValidCode();
      result.fold((failure) {
        emit(ErrorState(failure.message));
      }, (data) {
        emit(SuccessValidCodeState(allvalidcodeModel: data));
      });
    });

    on<CreateWalletEvent>((event, emit) async {
      emit(LoadingState());
      var result =
          await WalletServiceImp().createWallet(event.createWalletModel);
      result.fold((failure) {
        emit(ErrorState(failure.message));
      }, (data) {
        emit(SuccessState(data: data));
      });
    });

    on<EditeWalletEvent>((event, emit) async {
      emit(LoadingState());
      var result = await WalletServiceImp().editeWallet(event.addMonyModel);
      result.fold((failure) {
        emit(ErrorState(failure.message));
      }, (data) {
        emit(SuccessState(data: data));
      });
    });
  }
}
