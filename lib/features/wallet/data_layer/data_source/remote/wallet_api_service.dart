import '../../../domain_layer/entities/wallet_info_entity.dart';
import '../../../domain_layer/entities/wallet_valid_code_entity.dart';

abstract class WalletApiService{
  Future<bool> createWallet(walletEntity);
  Future<WalletInfoEntity> getWalletInfo();
  Future<WalletValidCodeEntity> getValidCode();
  Future<bool> addMoneyToWallet(balanceEntity);
}