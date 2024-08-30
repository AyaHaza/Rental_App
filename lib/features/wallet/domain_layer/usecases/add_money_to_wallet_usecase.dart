import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/balance_entity.dart';
import '../repository/wallet_repository.dart';


class AddMoneyToWalletUsecase extends UseCse<Either<Failure, bool>,BalanceEntity> {
  WalletRepository walletRepository;
  AddMoneyToWalletUsecase(
      this.walletRepository,
      );

  Future<Either<Failure, bool>> call(balanceEntity) async {
    return await walletRepository.addMoneyToWallet(balanceEntity);
  }
}