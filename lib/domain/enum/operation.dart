enum Operation {
  receive,
  expense;

  String get value {
    switch (this) {
      case Operation.receive:
        return 'receive';
      case Operation.expense:
        return 'expense';
    }
  }
}
