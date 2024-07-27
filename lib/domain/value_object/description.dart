import 'package:projectzeta/domain/value_object/default_value_object.dart';
import 'package:projectzeta/utils/utils.dart';

class Description implements ValueObject {
  final String _value;

  Description(
    this._value,
  );

  @override
  String? validator([Object? value]) {
    if (_value.isEmpty) {
      return R.strings.fieldDescriptionIsEmpty;
    }

    return null;
  }

  @override
  String toString() => _value;
}
