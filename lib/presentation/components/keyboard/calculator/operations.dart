enum CalculatorOperation {
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  zero,
  add,
  subtract,
  multiply,
  divide,
  delete,
  clear,
  parentheses,
  percentage,
  decimal,
  invert,
  equals;

  bool get isCyanButtons {
    const listOperations = [
      CalculatorOperation.one,
      CalculatorOperation.two,
      CalculatorOperation.three,
      CalculatorOperation.four,
      CalculatorOperation.five,
      CalculatorOperation.six,
      CalculatorOperation.seven,
      CalculatorOperation.eight,
      CalculatorOperation.nine,
      CalculatorOperation.zero,
      CalculatorOperation.clear,
      CalculatorOperation.parentheses,
      CalculatorOperation.percentage,
    ];

    return listOperations.contains(this);
  }

  bool get isGreen {
    const listOperations = [CalculatorOperation.equals];

    return listOperations.contains(this);
  }

  String get value {
    switch (this) {
      case CalculatorOperation.one:
        return '1';
      case CalculatorOperation.two:
        return '2';
      case CalculatorOperation.three:
        return '3';
      case CalculatorOperation.four:
        return '4';
      case CalculatorOperation.five:
        return '5';
      case CalculatorOperation.six:
        return '6';
      case CalculatorOperation.seven:
        return '7';
      case CalculatorOperation.eight:
        return '8';
      case CalculatorOperation.nine:
        return '9';
      case CalculatorOperation.zero:
        return '0';
      case CalculatorOperation.add:
        return '+';
      case CalculatorOperation.subtract:
        return '-';
      case CalculatorOperation.multiply:
        return 'x';
      case CalculatorOperation.divide:
        return '/';
      case CalculatorOperation.delete:
        return 'DEL';
      case CalculatorOperation.decimal:
        return '.';
      case CalculatorOperation.invert:
        return '+/-';
      case CalculatorOperation.parentheses:
        return '( )';
      case CalculatorOperation.clear:
        return 'C';
      case CalculatorOperation.percentage:
        return '%';
      case CalculatorOperation.equals:
        return '=';
      default:
        return '';
    }
  }
}
