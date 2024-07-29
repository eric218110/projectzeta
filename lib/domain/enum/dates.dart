import 'package:projectzeta/utils/utils.dart';

enum Dates {
  today,
  yesterday,
  tomorrow,
  others,
  all;

  String get value {
    switch (this) {
      case Dates.today:
        return R.strings.today;
      case Dates.yesterday:
        return R.strings.yesterday;
      case Dates.tomorrow:
        return R.strings.tomorrow;
      case Dates.others:
        return "${R.strings.others}${R.strings.dots}";
      case Dates.all:
        return "";
    }
  }

  List<String> get toList {
    return List.from([
      Dates.today.value,
      Dates.yesterday.value,
      Dates.tomorrow.value,
      Dates.others.value
    ]);
  }
}
