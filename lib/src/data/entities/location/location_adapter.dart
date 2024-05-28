import 'package:projectzeta/src/domain/domain.dart';

abstract class LocationAdapter {
  final Locale locale;

  LocationAdapter({required this.locale});

  String? convertCurrencyValueInString({
    required double valueToConvert,
  });
}