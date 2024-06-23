import 'package:intl/intl.dart';
import 'package:projectzeta/data/data.dart';

class LocationAdapterImplementation extends LocationAdapter {
  LocationAdapterImplementation({required super.locale});

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
