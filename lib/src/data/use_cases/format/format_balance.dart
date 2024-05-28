import 'package:projectzeta/src/data/data.dart';
import 'package:projectzeta/src/domain/entities/money/format.dart';
import 'package:projectzeta/src/domain/use_cases/use_cases.dart';

class FormatBalanceImplementation implements FormatBalance {
  final LocationProvider locationProvider;
  final String locale = 'pt-br';

  FormatBalanceImplementation({required this.locationProvider});

  @override
  MoneyFormatEntity onFormatByDouble(double balance) {
    var balanceToFormat = locationProvider.convertCurrencyValueInString(
      locale: locale,
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
