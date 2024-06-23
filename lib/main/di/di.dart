import 'package:get_it/get_it.dart';
import 'package:projectzeta/data/entities/entities.dart';
import 'package:projectzeta/data/provider/decode/encode.dart';
import 'package:projectzeta/data/provider/encode/encode.dart';
import 'package:projectzeta/data/provider/storage/onboarding/storage_onboarding.dart';
import 'package:projectzeta/data/use_cases/onboarding/onboarding.dart';
import 'package:projectzeta/data/use_cases/use_cases.dart';
import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/domain/use_cases/on_boarding/load_onboarding.dart';
import 'package:projectzeta/infra/convert/convert.dart';
import 'package:projectzeta/infra/infra.dart';
import 'package:projectzeta/infra/shared_preferences/onboarding.dart';

GetIt getIt = GetIt.instance;

setupDependencyInjections() {
  final converterInstance = Convert();

  getIt.registerLazySingleton<Locale>(() => Locale.ptBr);
  getIt.registerLazySingleton<LocationAdapter>(
    () => LocationAdapterImplementation(
      locale: getIt<Locale>(),
    ),
  );
  getIt.registerLazySingleton<FormatBalance>(
    () => FormatBalanceImplementation(
      locationAdapter: getIt<LocationAdapter>(),
    ),
  );
  getIt.registerLazySingleton<Encode>(() => converterInstance);
  getIt.registerLazySingleton<Decode>(() => converterInstance);
  getIt.registerLazySingleton<StorageOnboarding>(
    () => OnboardingImplementationWithSharedPreferences(
      getIt<Encode>(),
      getIt<Decode>(),
    ),
  );
  getIt.registerLazySingleton<OnLoadOnboarding>(
    () => OnLoadOnboardingImplementation(
      storageOnboarding: getIt<StorageOnboarding>(),
    ),
  );
}
