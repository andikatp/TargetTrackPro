import 'package:business/domain/entities/core/user.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'user', primaryKeys: ['email'])
class UserModel extends User {
  const UserModel({
    required super.email,
    required super.password,
    required super.role,
  });

  factory UserModel.fromEntity(User user) {
    return UserModel(
      email: user.email,
      password: user.password,
      role: user.role,
    );
  }
}
