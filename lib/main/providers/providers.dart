import 'package:projectzeta/presentation/store/reducer/reducer.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderLoader {
  ProviderLoader._internal();

  static List<SingleChildWidget> load() {
    return [
      ChangeNotifierProvider<AccountReducer>(
        create: (context) => AccountReducer(),
      ),
      ChangeNotifierProvider<UserReducer>(
        create: (context) => UserReducer.create(),
      ),
      ChangeNotifierProvider<AuthUserByEmailAndPassword>(
        create: (context) => AuthUserByEmailAndPassword.create(context),
      ),
      ChangeNotifierProvider<BalanceReducer>(
        create: (context) => BalanceReducer.create(context),
      ),
      ChangeNotifierProvider<ShowYourBalanceReducer>(
        create: (_) => ShowYourBalanceReducer(),
      ),
      ChangeNotifierProvider<FormExpenseReducer>(
        create: (_) => FormExpenseReducer(),
      ),
    ];
  }
}
