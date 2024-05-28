import 'package:projectzeta/src/data/entities/entities.dart';
import 'package:projectzeta/src/domain/enum/locale.dart';
import 'package:projectzeta/src/infra/infra.dart';
import 'package:test/test.dart';

void main() {
  group('LocationProvider', () {
    late LocationAdapter sut;

    setUp(() {
      sut = LocationAdapterImplementantion(locale: Locale.ptBr);
    });

    test('should convertCurrencyValueInString return value correct', () {
      var result = sut.convertCurrencyValueInString(valueToConvert: 1000.00);

      expect(result, '1.000,00');
    });
  });
}
