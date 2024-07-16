import 'package:mocktail/mocktail.dart';
import 'package:projectzeta/data/entities/entities.dart';
import 'package:projectzeta/data/use_cases/use_cases.dart';
import 'package:projectzeta/domain/domain.dart';
import 'package:test/test.dart';

class MockLocationAdapter extends Mock implements LocationAdapter {}

void main() {
  group('FormatBalance', () {
    late LocationAdapter locationAdapter;
    late FormatBalance sut;

    setUp(() {
      locationAdapter = MockLocationAdapter();
      sut = FormatBalanceService(locationAdapter: locationAdapter);

      when(
        () => locationAdapter.convertCurrencyValueInString(
          valueToConvert: any(named: 'valueToConvert'),
        ),
      ).thenReturn('1.234,56');
    });

    test('should call convertCurrencyValueInString with correct values', () {
      sut.onFormatByDouble(1000.00);

      verify(
        () => locationAdapter.convertCurrencyValueInString(
          valueToConvert: 1000.00,
        ),
      ).called(1);
    });

    test('should throws error if not possible convert values', () {
      when(
        () => locationAdapter.convertCurrencyValueInString(
          valueToConvert: any(named: 'valueToConvert'),
        ),
      ).thenReturn(null);

      expect(() => sut.onFormatByDouble(1000.00), throwsException);
    });

    test('should return values correct when success', () {
      MoneyFormatModel result = sut.onFormatByDouble(1234.56);

      expect(result.money, '1 234');
      expect(result.cents, ',56');
    });
  });
}
