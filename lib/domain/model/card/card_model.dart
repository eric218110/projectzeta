import 'package:flutter/material.dart';

class CardModel {
  final Color color;
  final String name;
  final String lastNumbers;
  final String cardType;

  CardModel({
    required this.name,
    required this.lastNumbers,
    required this.cardType,
    required this.color,
  });
}
