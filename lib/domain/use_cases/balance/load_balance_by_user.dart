import 'package:projectzeta/domain/domain.dart';

abstract class LoadBalanceByUser {
  Future<BalanceModel> load(UserModel userModel);
}
