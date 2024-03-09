import 'package:business/domain/entities/core/user.dart';
import 'package:business/domain/usecases/auth/login.dart';
import 'package:business/domain/usecases/auth/register.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required Login login, required Register register})
      : _login = login,
        _register = register,
        super(const AuthInitial()) {
    on<AuthEvent>((event, emit) => emit(const AuthLoading()));
    on<AuthLoginEvent>(_loginHandler);
    on<AuthRegisterEvent>(_registerHandler);
  }

  final Login _login;
  final Register _register;

  Future<void> _loginHandler(
    AuthLoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result =
        await _login(LoginParams(email: event.email, password: event.password));
    result.fold(
      (failure) => emit(AuthError(message: failure.message)),
      (user) => emit(AuthLoggedIn(user: user)),
    );
  }

  Future<void> _registerHandler(
    AuthRegisterEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _register(event.user);
    result.fold(
      (failure) => emit(AuthError(message: failure.errorMessage)),
      (_) => emit(const AuthRegistered()),
    );
  }
}
