part of 'dependency_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await productInit();
  await businessInit();
  await marketingInit();
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
        saveBusinessTarget: sl(),
        editBusinessTarget: sl(),
        deleteBusinessTarget: sl(),
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

Future<void> marketingInit() async {
  sl
    ..registerFactory(
      () => MarketingBloc(
        getMarketingTargets: sl(),
        saveMarketingTarget: sl(),
        editMarketingTarget: sl(),
        deleteMarketingTarget: sl(),
      ),
    )
    ..registerLazySingleton(() => GetMarketingTargets(repository: sl()))
    ..registerLazySingleton(() => SaveMarketingTarget(repository: sl()))
    ..registerLazySingleton(() => EditMarketingTarget(repository: sl()))
    ..registerLazySingleton(() => DeleteMarketingTarget(repository: sl()))
    ..registerLazySingleton<MarketingRepository>(
      () => MarketingRepositoriesImpl(database: sl()),
    );
}
