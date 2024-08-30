import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/wallet_info_entity.dart';
import '../entities/wallet_valid_code_entity.dart';

abstract class WalletRepository{
  Future<Either<Failure, bool>> createWallet(walletEntity);
  Future<Either<Failure, WalletInfoEntity>> getWalletInfo();
  Future<Either<Failure, WalletValidCodeEntity>> getValidCode();
  Future<Either<Failure, bool>> addMoneyToWallet(balanceEntity);

}