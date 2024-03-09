import 'package:business/core/utils/typedef.dart';

abstract class SplashRepository {
  const SplashRepository();

  ResultFuture<bool> checkUserIsLoggedIn();
}
