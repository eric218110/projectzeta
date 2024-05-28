import 'package:mocktail/mocktail.dart';
import 'package:projectzeta/src/data/entities/entities.dart';
import 'package:projectzeta/src/data/use_cases/use_cases.dart';
import 'package:projectzeta/src/domain/domain.dart';
import 'package:test/test.dart';

// Criação do mock da classe LocationProvider
class MockLocationProvider extends Mock implements LocationProvider {}

void main() {
  setUpAll(() {
    registerFallbackValue(MockLocationProvider());
  });

  group('FormatBalance', () {
    late LocationProvider locationProviderSpy;
    late FormatBalance sut;

    setUp(() {
      locationProviderSpy = MockLocationProvider();
      sut = FormatBalanceImplementation(locationProvider: locationProviderSpy);

      when(
        () => locationProviderSpy.convertCurrencyValueInString(
          locale: any(named: 'locale'),
          valueToConvert: any(named: 'valueToConvert'),
        ),
      ).thenReturn('1000,00');
    });

    test('should call convertCurrencyValueInString with correct values', () {
      sut.onFormatByDouble(1000.00);

      verify(
        () => locationProviderSpy.convertCurrencyValueInString(
          locale: 'pt-br',
          valueToConvert: 1000.00,
        ),
      ).called(1);
    });
  });
}
