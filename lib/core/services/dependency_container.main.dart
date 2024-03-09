part of 'dependency_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await productInit();
  await businessInit();
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
      () => ProductRepositoriesImpl(database: sl()),
    )
    ..registerSingleton<AppDatabase>(database);
}

Future<void> businessInit() async {
  sl
    ..registerFactory(
      () => BusinessBloc(
        getBusinessTargets: sl(),
        saveBusinessTargets: sl(),
        editBusinessTargets: sl(),
        deleteBusinessTargets: sl(),
      ),
    )
    ..registerLazySingleton(() => GetBusinessTargets(repository: sl()))
    ..registerLazySingleton(() => SaveBusinessTarget(repository: sl()))
    ..registerLazySingleton(() => EditBusinessTarget(repository: sl()))
    ..registerLazySingleton(() => DeleteBusinessTarget(repository: sl()))
    ..registerLazySingleton<BusinessRepository>(
      () => BusinessRepositoriesImpl(database: sl()),
    );
}
