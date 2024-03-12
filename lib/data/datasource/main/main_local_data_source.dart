import 'package:business/core/services/notification_service.dart';
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
  Future<void> logOut() async {
    await NotificationService.cancelAll();
    await _preferences.clear();
  }
}
