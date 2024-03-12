import 'package:business/core/utils/typedef.dart';

abstract class MainRepository {
  const MainRepository();

  ResultFuture<void> logOut();
}
