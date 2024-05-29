import 'package:get_it/get_it.dart';
import 'package:projectzeta/src/data/entities/entities.dart';
import 'package:projectzeta/src/data/use_cases/use_cases.dart';
import 'package:projectzeta/src/domain/domain.dart';
import 'package:projectzeta/src/infra/infra.dart';

GetIt getIt = GetIt.instance;

setupDependencyInjections() {
  getIt.registerLazySingleton<Locale>(() => Locale.ptBr);
  getIt.registerLazySingleton<LocationAdapter>(
    () => LocationAdapterImplementantion(
      locale: getIt<Locale>(),
    ),
  );
  getIt.registerLazySingleton<FormatBalance>(
    () => FormatBalanceImplementation(
      locationAdapter: getIt<LocationAdapter>(),
    ),
  );
}
