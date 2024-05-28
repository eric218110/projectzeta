import 'package:projectzeta/src/data/data.dart';
import 'package:projectzeta/src/domain/entities/money/format.dart';
import 'package:projectzeta/src/domain/use_cases/use_cases.dart';

class FormatBalanceImplementation implements FormatBalance {
  final LocationProvider locationProvider;

  FormatBalanceImplementation({required this.locationProvider});

  @override
  MoneyFormatEntity onFormatByDouble(double balance) {
    locationProvider.convertCurrencyValueInString(
      locale: 'pt-br',
      valueToConvert: balance,
    );

    return MoneyFormatEntity(cents: '0', money: '0');
  }
}
