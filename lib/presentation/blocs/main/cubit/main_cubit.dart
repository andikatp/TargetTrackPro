import 'package:business/domain/usecases/main/log_out.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit({
    required LogOut logOut,
  })  : _logOut = logOut,
        super(const MainInitial());

  final LogOut _logOut;

  Future<void> logOut() async {
    emit(const MainLoading());
    final result = await _logOut();
    result.fold((failure) => emit(MainError(message: failure.errorMessage)),
        (_) => emit(const MainLoggedOut()),);
  }
}
