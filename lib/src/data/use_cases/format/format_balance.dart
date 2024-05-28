import 'package:projectzeta/src/data/data.dart';
import 'package:projectzeta/src/domain/entities/money/format.dart';
import 'package:projectzeta/src/domain/use_cases/use_cases.dart';

class FormatBalanceImplementation implements FormatBalance {
  final LocationProvider locationProvider;
  final String locale = 'pt-br';

  FormatBalanceImplementation({required this.locationProvider});

  @override
  MoneyFormatEntity onFormatByDouble(double balance) {
    var centsConverted = locationProvider.convertCurrencyValueInString(
      locale: locale,
      valueToConvert: balance,
    );

    var moneyConverted = locationProvider.convertCurrencyValueInString(
      locale: locale,
      valueToConvert: balance,
    );

    if (centsConverted == null || moneyConverted == null) {
      throw Exception('Not possible convert balance values');
    }

    return MoneyFormatEntity(cents: '0', money: '0');
  }
}
