import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/wallet_valid_code_entity.dart';
import '../repository/wallet_repository.dart';


class GetValidCodeUsecase extends UseCse<Either<Failure, WalletValidCodeEntity>,String> {
  WalletRepository walletRepository;
  GetValidCodeUsecase(
      this.walletRepository,
      );

  Future<Either<Failure, WalletValidCodeEntity>> call(string) async {
    return await walletRepository.getValidCode();
  }
}