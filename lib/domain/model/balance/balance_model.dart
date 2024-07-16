class BalanceModel {
  final double value;

  BalanceModel({
    required this.value,
  });

  factory BalanceModel.empty() {
    return BalanceModel(value: 0);
  }
}
