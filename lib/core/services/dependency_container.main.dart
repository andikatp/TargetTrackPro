part of 'dependency_container.dart';

final sl = GetIt.instance;

class DependencyContainer {
  static Future<void> init() async {
    await _initSplash();
    await _initAuth();
    await _initMain();
    await _productInit();
    await _businessInit();
    await _marketingInit();
  }

  static Future<void> _initSplash() async {
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

  static Future<void> _productInit() async {
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
        () => ProductRepositoriesImpl(database: sl(), preferences: sl()),
      )
      ..registerSingleton<AppDatabase>(database);
  }

  static Future<void> _businessInit() async {
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
        () => BusinessRepositoriesImpl(database: sl(), preferences: sl()),
      );
  }

  static Future<void> _marketingInit() async {
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
        () => MarketingRepositoriesImpl(database: sl(), preferences: sl()),
      );
  }

  static Future<void> _initAuth() async {
    final userDatabase =
        await $FloorUserDatabase.databaseBuilder('user_database.db').build();

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

  static Future<void> _initMain() async {
    sl
      ..registerFactory(() => MainCubit(logOut: sl()))
      ..registerLazySingleton(() => LogOut(repository: sl()))
      ..registerLazySingleton<MainRepository>(
        () => MainRepositoryImpl(dataSource: sl()),
      )
      ..registerLazySingleton<MainLocalDataSource>(
        () => MainLocalDataSourceImpl(preferences: sl()),
      );
  }
}
