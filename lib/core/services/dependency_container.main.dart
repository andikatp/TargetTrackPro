import 'package:business/data/datasource/app_database.dart';

part 'dependency_container.dart';

Future<void> init() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
}
