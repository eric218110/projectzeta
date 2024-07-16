sealed class BalanceState {
  final double value;

  BalanceState({required this.value});
}

class BalanceStateEmpty implements BalanceState {
  @override
  double get value => 0;
}
