import 'package:get_it/get_it.dart';
import 'package:projectzeta/data/entities/entities.dart';
import 'package:projectzeta/data/provider/http/client.dart';
import 'package:projectzeta/data/provider/storage/onboarding/storage_onboarding.dart';
import 'package:projectzeta/data/provider/storage/user/user.dart';
import 'package:projectzeta/data/provider/validator/validator.dart';
import 'package:projectzeta/data/use_cases/auth/auth_service.dart';
import 'package:projectzeta/data/use_cases/onboarding/onboarding.dart';
import 'package:projectzeta/data/use_cases/use_cases.dart';
import 'package:projectzeta/data/use_cases/user/storage/user.dart';
import 'package:projectzeta/data/validators/validator_service.dart';
import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/domain/use_cases/auth/auth_by_email_and_password.dart';
import 'package:projectzeta/domain/use_cases/on_boarding/load_onboarding.dart';
import 'package:projectzeta/domain/use_cases/on_boarding/save_onboarding.dart';
import 'package:projectzeta/domain/validator/validator.dart';
import 'package:projectzeta/infra/http/client.dart';
import 'package:projectzeta/infra/infra.dart';
import 'package:projectzeta/infra/shared_preferences/onboarding.dart';
import 'package:projectzeta/infra/shared_preferences/user.dart';
import 'package:projectzeta/infra/validator/string_validator.dart';

GetIt getIt = GetIt.instance;

setupDependencyInjections() {
  getIt.registerLazySingleton<Locale>(() => Locale.ptBr);
  getIt.registerLazySingleton<LocationAdapter>(
    () => LocationAdapterImplementation(locale: getIt<Locale>()),
  );

  getIt.registerLazySingleton<FormatBalance>(
    () => FormatBalanceImplementation(
      locationAdapter: getIt<LocationAdapter>(),
    ),
  );

  getIt.registerLazySingleton<StorageOnboarding>(
    () => OnboardingImplementationWithSharedPreferences(),
  );

  getIt.registerLazySingleton<OnLoadOnboarding>(
    () => OnLoadOnboardingImplementation(
      storageOnboarding: getIt<StorageOnboarding>(),
    ),
  );

  getIt.registerLazySingleton<OnSaveOnboarding>(
    () => OnLoadOnboardingImplementation(
      storageOnboarding: getIt<StorageOnboarding>(),
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

  getIt.registerLazySingleton<StorageUser>(
    () => UserImplementationWithSharedPreferences(),
  );

  getIt.registerLazySingleton<OnSaveUserInStorage>(
    () => UserStorageImplementation(storageUser: getIt<StorageUser>()),
  );

  getIt.registerLazySingleton<OnLoadUserInStorage>(
    () => UserStorageImplementation(storageUser: getIt<StorageUser>()),
  );
}
