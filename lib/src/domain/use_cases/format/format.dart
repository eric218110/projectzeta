import 'package:projectzeta/src/domain/entities/entities.dart';

abstract class FormatBalance {
  MoneyFormatModel onFormatByDouble(double balance);
}
