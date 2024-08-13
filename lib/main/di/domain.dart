import 'package:get_it/get_it.dart';
import 'package:projectzeta/domain/enum/enum.dart';

setupDependencyInjectionsDomain(GetIt getIt) {
  getIt.registerLazySingleton<Locales>(() => Locales.ptBr);
}
