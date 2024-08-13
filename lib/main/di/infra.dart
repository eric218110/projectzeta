import 'package:get_it/get_it.dart';
import 'package:projectzeta/data/data.dart';
import 'package:projectzeta/domain/enum/enum.dart';
import 'package:projectzeta/infra/infra.dart';

setupDependencyInjectionsInfra(GetIt getIt) async {
  getIt.registerLazySingleton<LocationAdapter>(
    () => LocationAdapterImplementation(locale: getIt<Locales>()),
  );

  getIt.registerLazySingleton<OnboardingRepository>(
    () => OnboardingImplementationWithSharedPreferences(),
  );

  getIt.registerLazySingleton<ValidatorProvider>(() => StringValidator());

  getIt.registerLazySingleton<HttpClientProvider>(
    () => UnoHttpClientProvider.init(),
  );

  getIt.registerLazySingleton<UserRepository>(
    () => UserImplementationWithSharedPreferences(),
  );

  getIt.registerLazySingletonAsync<ObjectBoxStore>(() async {
    final objectBoxStore = await ObjectBoxStore.create();
    return objectBoxStore;
  });

  await GetIt.instance.isReady<ObjectBoxStore>();

  getIt.registerLazySingleton<BalanceRepository>(
    () => BalanceObjectBoxRepository(objectBoxStore: getIt<ObjectBoxStore>()),
  );
}
