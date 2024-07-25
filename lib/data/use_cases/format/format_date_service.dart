import 'dart:ui';

import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:projectzeta/domain/use_cases/use_cases.dart';
import 'package:projectzeta/utils/utils.dart';

class FormatDateService implements FormateDate {
  final Locale locale;

  FormatDateService({
    required this.locale,
  });

  @override
  Future<String> onFormatNow() async {
    DateTime now = DateTime.now();
    String format = '';

    await initializeDateFormatting('pt_BR', null);

    var x = DateFormat(R.strings.dateFormatToMonth, 'pt_BR').format(now);
    format = x;

    return format;
  }
}
