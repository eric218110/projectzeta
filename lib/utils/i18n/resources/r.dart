import 'package:flutter/material.dart';
import 'package:projectzeta/utils/i18n/strings/string.dart';

class R {
  static Translations strings = PtBr();

  static load(Locale locale) {
    switch (locale.toString()) {
      case 'en_US':
        throw Exception('Not implements locale en_US');
      default:
        strings = PtBr();
    }
  }
}
