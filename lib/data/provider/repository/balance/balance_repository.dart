import 'package:projectzeta/data/entities/entities.dart';

abstract class BalanceRepository {
  Future<BalanceEntity> onLoadByUserId(String userId);
}
