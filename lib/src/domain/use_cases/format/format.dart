import 'package:projectzeta/src/domain/entities/entities.dart';

abstract class FormatBalance {
  MoneyFormatEntity onFormatByDouble(double balance);
}
