part of 'service_locator.imports.dart';

final sl = GetIt.instance;
Future<void> initDependencies() async {
  //!Core

  sl.registerLazySingleton<ConnectionChecker>(
    () => ConnectionCheckerImpl(sl()),
  );

  sl.registerLazySingleton<AppInterceptors>(() => AppInterceptors(sl()));
  //!Core
  sl.registerLazySingleton<InternetConnection>(() => InternetConnection());
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));
  sl.registerLazySingleton<SocialAuthHandler>(() => SocialAuthHandler());

  //! Auth
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl(), sl()),
  );
  sl.registerFactory<AuthCubit>(() => AuthCubit(sl()));

  //! Initiate Businesses
  sl.registerLazySingleton<InitiateBusinessRepository>(
    () => InitiateBusinessRepositoryImpl(sl()),
  );
  sl.registerFactory<InitiateBusinessCubit>(() => InitiateBusinessCubit(sl()));

  //! Businesses
  sl.registerLazySingleton<BusinessesRepository>(
    () => BusinessesRepositoryImpl(sl()),
  );
  sl.registerFactory<BusinessesCubit>(() => BusinessesCubit(sl()));

  //! Profile
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(sl()),
  );
  sl.registerFactory<ProfileCubit>(() => ProfileCubit(sl()));

  //! Posts
  sl.registerLazySingleton<PostsRepository>(() => PostsRepositoryImpl(sl()));
  sl.registerFactory<PostsCubit>(() => PostsCubit(sl()));
}
