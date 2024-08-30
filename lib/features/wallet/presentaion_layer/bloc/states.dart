
abstract class WalletState {}

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

class SuccessBoolState extends WalletState {
}
