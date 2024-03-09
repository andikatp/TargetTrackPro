import 'package:business/core/utils/enums.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({required this.email, required this.password, required this.role});

  final String email;
  final String password;
  final UserRole role;

  @override
  List<Object?> get props => [email, password, role];
}
