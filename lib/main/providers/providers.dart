import 'package:projectzeta/presentation/store/reducer/reducer.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderLoader {
  ProviderLoader._internal();

  static List<SingleChildWidget> load() {
    return [
      ChangeNotifierProvider<AuthUserByEmailAndPassword>(
        create: (_) => AuthUserByEmailAndPassword.create(),
      ),
      ChangeNotifierProvider<BalanceReducer>(
        create: (context) => BalanceReducer.create(context),
      ),
      ChangeNotifierProvider<ShowYourBalanceReducer>(
        create: (_) => ShowYourBalanceReducer(),
      ),
    ];
  }
}
