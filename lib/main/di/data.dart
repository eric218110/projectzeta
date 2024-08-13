import 'dart:ui';

import 'package:get_it/get_it.dart';
import 'package:projectzeta/data/data.dart';
import 'package:projectzeta/domain/use_cases/use_cases.dart';
import 'package:projectzeta/domain/validator/validator.dart';

setupDependencyInjectionsData(GetIt getIt) {
  getIt.registerLazySingleton<FormatBalance>(
    () => FormatBalanceService(
      locationAdapter: getIt<LocationAdapter>(),
    ),
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

  getIt.registerLazySingleton<EmailValidator>(
    () => ValidatorService(validatorProvider: getIt<ValidatorProvider>()),
  );

  getIt.registerLazySingleton<AuthByEmailAndPassword>(
    () => AuthService(httpClientProvider: getIt<HttpClientProvider>()),
  );

  getIt.registerLazySingleton<OnSaveUserInStorage>(
    () => UserService(userRepository: getIt<UserRepository>()),
  );

  getIt.registerLazySingleton<OnLoadUserInStorage>(
    () => UserService(userRepository: getIt<UserRepository>()),
  );

  getIt.registerLazySingleton<LoadBalanceByUser>(
    () => BalanceService(balanceRepository: getIt<BalanceRepository>()),
  );

  getIt.registerLazySingleton<Date>(() => DateService());

  getIt.registerLazySingleton<LoadAccountByUser>(
    () => AccountService(httpClientProvider: getIt<HttpClientProvider>()),
  );

  getIt.registerLazySingleton<FormateDate>(
    () => FormatDateService(locale: const Locale('pt', 'BR')),
  );
}
