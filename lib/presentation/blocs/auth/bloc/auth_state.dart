part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {
  const AuthInitial();
}

final class AuthLoading extends AuthState {
  const AuthLoading();
}

final class AuthLoggedIn extends AuthState {
  const AuthLoggedIn({required this.user});
  final User user;

  @override
  List<Object> get props => [user];
}

final class AuthRegistered extends AuthState {
  const AuthRegistered();
}

final class AuthError extends AuthState {
  const AuthError({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
