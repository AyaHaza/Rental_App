// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'wallet_bloc.dart';

sealed class WalletState extends Equatable {
  const WalletState();

  @override
  List<Object> get props => [];
}

final class WalletInitial extends WalletState {}
class LoadingState extends WalletState {}
class ErrorState extends WalletState {
  String failure;
  ErrorState(this.failure);
}
class SuccessState extends WalletState {
var data;
  SuccessState({
    required this.data,
  });
}

class SuccessValidCodeState extends WalletState {
AllvalidcodeModel allvalidcodeModel;
  SuccessValidCodeState({
    required this.allvalidcodeModel,
  });
}
