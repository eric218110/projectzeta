import 'package:get_it/get_it.dart';
import 'package:projectzeta/data/entities/entities.dart';
import 'package:projectzeta/data/use_cases/use_cases.dart';
import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/infra/infra.dart';

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
