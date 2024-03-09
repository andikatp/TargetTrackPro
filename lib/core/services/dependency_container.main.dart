part of 'dependency_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await initSplash();
  await initAuth();
  await productInit();
  await businessInit();
  await marketingInit();
}

Future<void> initSplash() async {
  sl
    ..registerFactory(() => SplashCubit(repository: sl()))
    ..registerLazySingleton<SplashRepository>(
      () => SplashRepositoryImpl(localDataSource: sl()),
    )
    ..registerLazySingleton<SplashLocalDataSource>(
      () => SplashLocalDataSourceImpl(preference: sl()),
    )
    ..registerLazySingletonAsync(SharedPreferences.getInstance);
  await GetIt.instance.isReady<SharedPreferences>();
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

Future<void> initAuth() async {
  final userDatabase =
      await $FloorUserDatabase.databaseBuilder('app_database.db').build();

  sl
    ..registerFactory(() => AuthBloc(login: sl(), register: sl()))
    ..registerLazySingleton(() => Login(repository: sl()))
    ..registerLazySingleton(() => Register(repository: sl()))
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(dataSource: sl()),
    )
    ..registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(preference: sl(), database: sl()),
    )
    ..registerSingleton<UserDatabase>(userDatabase);
}
