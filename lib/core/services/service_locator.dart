part of 'service_locator.imports.dart';

final sl = GetIt.instance;
Future<void> initDependencies() async {
  //Core

  sl.registerLazySingleton<ConnectionChecker>(
    () => ConnectionCheckerImpl(sl()),
  );

  sl.registerLazySingleton<AppInterceptors>(() => AppInterceptors());
  //Core
  sl.registerLazySingleton<InternetConnection>(() => InternetConnection());
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));
}
