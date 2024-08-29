part of 'wallet_bloc.dart';

sealed class WalletEvent extends Equatable {
  const WalletEvent();

  @override
  List<Object> get props => [];
}

class GetWalletInfo extends WalletEvent {}

class GetAllvalidCodeEvent extends WalletEvent{}

class CreateWalletEvent extends WalletEvent {
  CreateWalletModel createWalletModel;
  CreateWalletEvent(this.createWalletModel);
}

class EditeWalletEvent extends WalletEvent {
  AddMonyModel addMonyModel;
  EditeWalletEvent(this.addMonyModel);
}

