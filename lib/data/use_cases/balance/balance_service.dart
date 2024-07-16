import 'package:projectzeta/domain/model/balance/balance_model.dart';
import 'package:projectzeta/domain/model/user/user.dart';
import 'package:projectzeta/domain/use_cases/balance/load_balance_by_user.dart';

class BalanceService implements LoadBalanceByUser {
  @override
  Future<BalanceModel> load(UserModel userModel) {
    // TODO: implement load
    throw UnimplementedError();
  }
}
