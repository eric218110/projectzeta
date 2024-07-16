import 'package:projectzeta/.generated/objectbox/objectbox.g.dart';
import 'package:projectzeta/data/data.dart';
import 'package:projectzeta/infra/infra.dart';
import 'package:projectzeta/infra/object_box/schema/balance_schema.dart';
import 'package:projectzeta/infra/object_box/store/store.dart';

class BalanceObjectBoxRepository implements BalanceRepository {
  final ObjectBoxStore objectBoxStore;

  BalanceObjectBoxRepository({required this.objectBoxStore});

  @override
  Future<BalanceEntity> onLoadByUserId(String userId) async {
    var box = objectBoxStore.store.box<BalanceSchema>();
    var query = box.query(BalanceSchema_.userId.equals(userId)).build();

    var result = query.findFirst();
    query.close();

    if (result == null) {
      return BalanceEntity(value: 0);
    }

    return BalanceEntity(value: result.value);
  }
}
