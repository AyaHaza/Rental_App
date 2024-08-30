import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain_layer/usecases/get_valid_code_usecase.dart';
import 'events.dart';
import 'states.dart';

class BlocCode extends Bloc<WalletEvent, WalletState> {
  GetValidCodeUsecase getValidCodeUsecase;

  BlocCode(this.getValidCodeUsecase) : super(WalletInitial()) {
    on<GetAllvalidCodeEvent>((event, emit) async {
      emit(LoadingState());
      var result = await getValidCodeUsecase.call('get');
      result.fold((failure) {
        emit(ErrorState(failure.message));
      }, (data) {
        emit(SuccessState(data: data));
      });
    });
  }
}
