import 'dart:ui';

import 'package:get_it/get_it.dart';
import 'package:projectzeta/data/data.dart';
import 'package:projectzeta/data/use_cases/format/format.dart';
import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/domain/validator/validator.dart';
import 'package:projectzeta/infra/infra.dart';
import 'package:projectzeta/infra/object_box/store/store.dart';

GetIt getIt = GetIt.instance;

Future<void> setupDependencyInjections() async {
  getIt.registerLazySingleton<Locales>(() => Locales.ptBr);

  getIt.registerLazySingleton<LocationAdapter>(
    () => LocationAdapterImplementation(locale: getIt<Locales>()),
  );

  getIt.registerLazySingleton<FormatBalance>(
    () => FormatBalanceService(
      locationAdapter: getIt<LocationAdapter>(),
    ),
  );

  getIt.registerLazySingleton<OnboardingRepository>(
    () => OnboardingImplementationWithSharedPreferences(),
  );

  getIt.registerLazySingleton<OnLoadOnboarding>(
    () => OnboardingService(
      onboardingRepository: getIt<OnboardingRepository>(),
    ),
  );

  getIt.registerLazySingleton<OnSaveOnboarding>(
    () => OnboardingService(
      onboardingRepository: getIt<OnboardingRepository>(),
    ),
  );

  getIt.registerLazySingleton<ValidatorProvider>(() => StringValidator());

  getIt.registerLazySingleton<EmailValidator>(
    () => ValidatorService(validatorProvider: getIt<ValidatorProvider>()),
  );

  getIt.registerLazySingleton<HttpClientProvider>(
    () => UnoHttpClientProvider.init(),
  );

  getIt.registerLazySingleton<AuthByEmailAndPassword>(
    () => AuthService(httpClientProvider: getIt<HttpClientProvider>()),
  );

  getIt.registerLazySingleton<UserRepository>(
    () => UserImplementationWithSharedPreferences(),
  );

  getIt.registerLazySingleton<OnSaveUserInStorage>(
    () => UserService(userRepository: getIt<UserRepository>()),
  );

  getIt.registerLazySingleton<OnLoadUserInStorage>(
    () => UserService(userRepository: getIt<UserRepository>()),
  );

  getIt.registerLazySingletonAsync<ObjectBoxStore>(() async {
    final objectBoxStore = await ObjectBoxStore.create();
    return objectBoxStore;
  });

  await GetIt.instance.isReady<ObjectBoxStore>();

  getIt.registerLazySingleton<BalanceRepository>(
    () => BalanceObjectBoxRepository(objectBoxStore: getIt<ObjectBoxStore>()),
  );

  getIt.registerLazySingleton<LoadBalanceByUser>(
    () => BalanceService(balanceRepository: getIt<BalanceRepository>()),
  );

  getIt.registerLazySingleton<Date>(() => DateService());

  getIt.registerLazySingleton<FormateDate>(
    () => FormatDateService(locale: const Locale('pt', 'BR')),
  );
}
