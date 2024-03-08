part of 'dependency_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await productInit();
}

Future<void> productInit() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  sl
    ..registerFactory(
      () => ProductBloc(
        getProductTargets: sl(),
        saveProductTarget: sl(),
        editProductTarget: sl(),
        deleteProductTarget: sl(),
      ),
    )
    ..registerLazySingleton(() => GetProductTargets(repository: sl()))
    ..registerLazySingleton(() => SaveProductTarget(repository: sl()))
    ..registerLazySingleton(() => EditProductTarget(repository: sl()))
    ..registerLazySingleton(() => DeleteProductTarget(repository: sl()))
    ..registerLazySingleton<ProductRepository>(
        () => ProductRepositoriesImpl(database: sl()),)
    ..registerSingleton<AppDatabase>(database);
}
