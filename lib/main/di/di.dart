import 'package:get_it/get_it.dart';
import 'package:projectzeta/data/data.dart';
import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/domain/validator/validator.dart';
import 'package:projectzeta/infra/infra.dart';

GetIt getIt = GetIt.instance;

setupDependencyInjections() {
  getIt.registerLazySingleton<Locale>(() => Locale.ptBr);
  getIt.registerLazySingleton<LocationAdapter>(
    () => LocationAdapterImplementation(locale: getIt<Locale>()),
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

  getIt.registerLazySingleton<LoadBalanceByUser>(
    () => BalanceService(),
  );
}
