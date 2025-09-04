part of 'service_locator.imports.dart';

final sl = GetIt.instance;
Future<void> initDependencies() async {
  //Core

  sl.registerLazySingleton<ConnectionChecker>(
    () => ConnectionCheckerImpl(sl()),
  );

  sl.registerLazySingleton<AppInterceptors>(() => AppInterceptors(sl()));
  //Core
  sl.registerLazySingleton<InternetConnection>(() => InternetConnection());
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  //! Auth
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerFactory<AuthCubit>(() => AuthCubit(sl()));
}
