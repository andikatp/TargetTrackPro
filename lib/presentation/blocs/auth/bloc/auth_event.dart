part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthLoginEvent extends AuthEvent {
  const AuthLoginEvent({required this.email, required this.password});
  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

class AuthRegisterEvent extends AuthEvent {
  const AuthRegisterEvent({required this.user});

  final User user;

  @override
  List<Object> get props => [user];
}
