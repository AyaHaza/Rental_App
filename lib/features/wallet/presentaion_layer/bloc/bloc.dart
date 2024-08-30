import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain_layer/usecases/add_money_to_wallet_usecase.dart';
import '../../domain_layer/usecases/create_wallet_usecase.dart';
import '../../domain_layer/usecases/get_wallet_info_usecase.dart';
import 'events.dart';
import 'states.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  CreateWalletUsecase createWalletUsecase;
  GetWalletInfoUsecase getWalletInfoUsecase;
  AddMoneyToWalletUsecase addMoneyToWalletUsecase;

  WalletBloc(this.createWalletUsecase,this.getWalletInfoUsecase,this.addMoneyToWalletUsecase) : super(WalletInitial()) {
    on<GetWalletInfo>((event, emit) async {
      emit(LoadingState());
      var result = await getWalletInfoUsecase.call('get');
      result.fold((failure) {
        emit(ErrorState(failure.message));
      }, (data) {
        emit(SuccessState(data: data));
      });
    });

    on<CreateWalletEvent>((event, emit) async {
      emit(LoadingState());
      var result =
      await createWalletUsecase.call(event.walletEntity);
      result.fold((failure) {
        emit(ErrorState(failure.message));
      }, (data) {
        emit(SuccessState(data: data));
      });
    });

    on<EditeWalletEvent>((event, emit) async {
      emit(LoadingState());
      var result = await addMoneyToWalletUsecase.call(event.balanceEntity);
      result.fold((failure) {
        emit(ErrorState(failure.message));
      }, (data) {
        emit(SuccessBoolState());
      });
    });
  }
}
