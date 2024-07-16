import 'package:projectzeta/domain/domain.dart';

class BalanceEntity {
  final double value;

  BalanceEntity({
    required this.value,
  });

  BalanceModel toModel() {
    return BalanceModel(value: value);
  }

  factory BalanceEntity.fromModel(BalanceModel model) {
    return BalanceEntity(value: model.value);
  }
}
