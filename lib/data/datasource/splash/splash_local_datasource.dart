import 'package:business/core/errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SplashLocalDataSource {
  const SplashLocalDataSource();

  Future<bool> checkUserIsLoggedIn();
}

class SplashLocalDataSourceImpl implements SplashLocalDataSource {
  SplashLocalDataSourceImpl({required SharedPreferences preference})
      : _preference = preference;
  final SharedPreferences _preference;

  @override
  Future<bool> checkUserIsLoggedIn() async {
    try {
      final result = _preference.getBool('isLoggedIn');
      return result != null;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
