import 'package:get_it/get_it.dart';
import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/presentation/store/form_expense/store.dart';
import 'package:projectzeta/presentation/store/store.dart';

setupDependencyInjectionsPresentation(GetIt getIt) {
  getIt.registerLazySingleton<AccountStore>(
    () => AccountStore(getIt<LoadAccountByUser>()),
  );
  getIt.registerLazySingleton<UserStore>(
    () => UserStore(getIt<OnSaveUserInStorage>(), getIt<OnLoadUserInStorage>()),
  );
  getIt.registerLazySingleton<AuthUserStore>(
    () => AuthUserStore(
      getIt<AuthByEmailAndPassword>(),
      getIt<OnSaveOnboarding>(),
      getIt<UserStore>(),
    ),
  );
  getIt.registerLazySingleton<BalanceStore>(
    () => BalanceStore(),
  );
  getIt.registerLazySingleton<FormExpenseStore>(
    () => FormExpenseStore(getIt<FormateDate>(), getIt<Date>()),
  );
  getIt.registerLazySingleton<ShowYourBalanceStore>(
    () => ShowYourBalanceStore(),
  );
}
