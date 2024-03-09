import 'package:business/data/models/core/user_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class UserDao {
  @insert
  Future<void> register(UserModel user);

 @Query('SELECT * FROM user WHERE email = :email')
  Future<UserModel?> login(String email);
}
