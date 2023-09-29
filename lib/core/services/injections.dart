part of core.services;

class Injections {
  static final locator = GetIt.instance;

  static void setupLocator() {
    //* Character
    locator.registerLazySingleton<CharacterDatasource>(
        () => CharacterDatasourceImpl());
    locator.registerLazySingleton<CharacterRepository>(
        () => CharacterRepositoryImpl(locator.get<CharacterDatasource>()));
    locator.registerLazySingleton<CharacterBloc>(
        () => CharacterBloc(locator.get<CharacterRepository>()));
    //Search
    locator.registerLazySingleton<SearchBloc>(
        () => SearchBloc(locator.get<CharacterRepository>()));
    //*Episode
    locator.registerLazySingleton<EpisodeDatasource>(
        () => EpisodeDatasourceImpl());
    locator.registerLazySingleton<EpisodeRepository>(
        () => EpisodeRepositoryImpl(locator.get<EpisodeDatasource>()));
    locator.registerLazySingleton<EpisodeBloc>(
        () => EpisodeBloc(locator.get<EpisodeRepository>()));
    //* Location
    locator.registerLazySingleton<LocationDatasource>(
        () => LocationDatasourceImpl());
    locator.registerLazySingleton<LocationRepository>(
        () => LocationRepositoryImpl(locator.get<LocationDatasource>()));
    locator.registerLazySingleton<LocationBloc>(
        () => LocationBloc(locator.get<LocationRepository>()));
    //* Navigation
    locator.registerLazySingleton<NavigationBloc>(() =>
        NavigationBloc(AuthInjections.locator.get<KeyValueStorageService>()));
  }
}

class AuthInjections {
  static final locator = GetIt.instance;

  static void setupLocatorAuth() {
    locator.registerLazySingleton<KeyValueStorageService>(
        () => KeyValueStorageServiceimpl());
    locator.registerLazySingleton<AuthBloc>(
        () => AuthBloc(locator.get<KeyValueStorageService>()));
    locator.registerLazySingleton<LoginFormBloc>(
        () => LoginFormBloc(locator.get<AuthBloc>().loginUser));
  }
}
