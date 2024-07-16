import 'package:projectzeta/data/data.dart';
import 'package:projectzeta/infra/infra.dart';
import 'package:projectzeta/infra/object_box/store/store.dart';
import 'package:projectzeta/objectbox.g.dart';

class BalanceObjectBoxRepository implements BalanceRepository {
  final ObjectBoxStore objectBoxStore;

  BalanceObjectBoxRepository({required this.objectBoxStore});

  @override
  Future<BalanceEntity> onLoadByUserId(String userId) async {
    var userBox = objectBoxStore.store.box<BalanceSchema>();
    var query = BalanceSchema_.userId.equals(userId);

    var result = userBox.query(query).build().findFirst();

    if (result == null) {
      return BalanceEntity(value: 0);
    }

    return BalanceEntity(value: result.value);
  }
}
