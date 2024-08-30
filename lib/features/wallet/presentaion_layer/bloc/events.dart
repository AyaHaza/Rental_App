
import '../../domain_layer/entities/balance_entity.dart';
import '../../domain_layer/entities/wallet_entity.dart';

abstract class WalletEvent {}

class GetWalletInfo extends WalletEvent {}

class GetAllvalidCodeEvent extends WalletEvent{}

class CreateWalletEvent extends WalletEvent {
 WalletEntity walletEntity;
  CreateWalletEvent(this.walletEntity);
}

class EditeWalletEvent extends WalletEvent {
 BalanceEntity balanceEntity;
  EditeWalletEvent(this.balanceEntity);
}

