import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/wallet_entity.dart';
import '../repository/wallet_repository.dart';


class CreateWalletUsecase extends UseCse<Either<Failure, bool>,WalletEntity> {
  WalletRepository walletRepository;
  CreateWalletUsecase(
      this.walletRepository,
      );

  Future<Either<Failure, bool>> call(walletEntity) async {
    return await walletRepository.createWallet(walletEntity);
  }
}