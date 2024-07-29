import 'package:projectzeta/domain/domain.dart';

class DateService implements Date {
  @override
  String dateToday() => DateTime.now().toIso8601String();

  @override
  String dateTomorrow() =>
      DateTime.now().add(const Duration(days: 1)).toIso8601String();

  @override
  String dateYesterday() =>
      DateTime.now().subtract(const Duration(days: 1)).toIso8601String();
}
