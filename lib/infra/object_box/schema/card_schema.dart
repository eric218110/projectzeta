import 'package:objectbox/objectbox.dart';

@Entity()
class CardSchema {
  int id;
  final String userId;
  final String color;
  final String name;
  final String lastNumbers;
  final String cardType;

  CardSchema({
    this.id = 0,
    required this.userId,
    required this.color,
    required this.name,
    required this.lastNumbers,
    required this.cardType,
  });
}
