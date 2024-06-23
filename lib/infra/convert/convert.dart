import 'dart:convert';

import 'package:projectzeta/data/provider/decode/encode.dart';
import 'package:projectzeta/data/provider/encode/encode.dart';

class Convert implements Encode, Decode {
  @override
  T onDecodeByStringObject<T>(String stringToDecode) {
    return jsonDecode(stringToDecode) as T;
  }

  @override
  String onEncodeByObjectToString<T>(T objectToEncode) {
    return jsonEncode(objectToEncode);
  }
}
