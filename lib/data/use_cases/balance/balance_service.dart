import 'package:projectzeta/data/data.dart';
import 'package:projectzeta/domain/model/balance/balance_model.dart';
import 'package:projectzeta/domain/model/user/user.dart';
import 'package:projectzeta/domain/use_cases/balance/load_balance_by_user.dart';

class BalanceService implements LoadBalanceByUser {
  final BalanceRepository balanceRepository;

  BalanceService({required this.balanceRepository});

  @override
  Future<BalanceModel> load(UserModel userModel) async {
    var result = await balanceRepository.onLoadByUserId(userModel.id);

    return result.toModel();
  }
}
