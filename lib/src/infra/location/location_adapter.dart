import 'package:intl/intl.dart';
import 'package:projectzeta/src/data/data.dart';

class LocationAdapterImplementantion extends LocationAdapter {
  LocationAdapterImplementantion({required super.locale});

  @override
  String? convertCurrencyValueInString({
    required double valueToConvert,
  }) {
    try {
      var formatter = NumberFormat.currency(locale: locale.value, symbol: '');
      return formatter.format(valueToConvert).trim();
    } catch (e) {
      return null;
    }
  }
}
