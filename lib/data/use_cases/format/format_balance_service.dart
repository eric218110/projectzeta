import 'package:projectzeta/data/data.dart';
import 'package:projectzeta/domain/model/money/format.dart';
import 'package:projectzeta/domain/use_cases/use_cases.dart';
import 'package:projectzeta/utils/utils.dart';

class FormatBalanceService implements FormatBalance {
  final LocationAdapter locationAdapter;

  FormatBalanceService({required this.locationAdapter});

  @override
  MoneyFormatModel onFormatByDouble(double balance) {
    var balanceToFormat = locationAdapter.convertCurrencyValueInString(
      valueToConvert: balance,
    );

    if (balanceToFormat == null) {
      throw Exception('Not possible convert balance values');
    }

    String money = balanceToFormat.replaceAll('.', ' ').split(',')[0];
    String cents = balanceToFormat.split(',')[1];

    return MoneyFormatModel(
      cents: ',$cents',
      money: '${R.strings.currencyType} $money',
    );
  }
}
