import 'package:projectzeta/src/domain/model/model.dart';

abstract class FormatBalance {
  MoneyFormatModel onFormatByDouble(double balance);
}
