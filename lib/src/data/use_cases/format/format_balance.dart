import 'package:projectzeta/src/data/data.dart';
import 'package:projectzeta/src/domain/entities/money/format.dart';
import 'package:projectzeta/src/domain/use_cases/use_cases.dart';

class FormatBalanceImplementation implements FormatBalance {
  final LocationAdapter locationAdapter;

  FormatBalanceImplementation({required this.locationAdapter});

  @override
  MoneyFormatEntity onFormatByDouble(double balance) {
    var balanceToFormat = locationAdapter.convertCurrencyValueInString(
      valueToConvert: balance,
    );

    if (balanceToFormat == null) {
      throw Exception('Not possible convert balance values');
    }

    String money = balanceToFormat.replaceAll('.', ' ').split(',')[0];
    String cents = balanceToFormat.split(',')[1];

    return MoneyFormatEntity(cents: ',$cents', money: money);
  }
}
