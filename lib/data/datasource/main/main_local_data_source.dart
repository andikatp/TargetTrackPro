import 'package:shared_preferences/shared_preferences.dart';

abstract class MainLocalDataSource {
  const MainLocalDataSource();

  Future<void> logOut();
}

class MainLocalDataSourceImpl implements MainLocalDataSource {
  MainLocalDataSourceImpl({required SharedPreferences preferences})
      : _preferences = preferences;
  final SharedPreferences _preferences;

  @override
  Future<void> logOut() async => _preferences.remove('isLoggedIn');
}
