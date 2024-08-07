import 'package:projectzeta/domain/domain.dart';

abstract class LocationAdapter {
  final Locales locale;

  LocationAdapter({required this.locale});

  String? convertCurrencyValueInString({
    required double valueToConvert,
  });
}
