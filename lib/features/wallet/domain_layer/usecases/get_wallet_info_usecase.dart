import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/wallet_info_entity.dart';
import '../repository/wallet_repository.dart';


class GetWalletInfoUsecase extends UseCse<Either<Failure, WalletInfoEntity>,String> {
  WalletRepository walletRepository;
  GetWalletInfoUsecase(
      this.walletRepository,
      );

  Future<Either<Failure, WalletInfoEntity>> call(string) async {
    return await walletRepository.getWalletInfo();
  }
}