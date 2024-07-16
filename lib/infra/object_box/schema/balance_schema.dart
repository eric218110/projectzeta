import 'package:objectbox/objectbox.dart';

@Entity()
class BalanceSchema {
  int id;
  String userId;
  double value;

  BalanceSchema({
    this.id = 0,
    required this.userId,
    required this.value,
  });
}
