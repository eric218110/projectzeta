import 'package:projectzeta/domain/model/model.dart';

abstract class FormatBalance {
  MoneyFormatModel onFormatByDouble(double balance);
}
