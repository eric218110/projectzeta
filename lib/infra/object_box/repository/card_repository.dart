import 'package:projectzeta/data/data.dart';
import 'package:projectzeta/infra/object_box/schema/card_schema.dart';
import 'package:projectzeta/infra/object_box/store/store.dart';
import 'package:projectzeta/objectbox.g.dart';

class CardObjectBoxRepository implements CardRepository {
  final ObjectBoxStore objectBoxStore;

  CardObjectBoxRepository({required this.objectBoxStore});

  @override
  Future<List<CardEntity>> loadAllCardByUserId(String userId) async {
    var box = objectBoxStore.store.box<CardSchema>();
    var query = CardSchema_.userId.equals(userId);
    var cards = await box.query(query).build().findAsync();

    if (cards.isEmpty) {
      return List<CardEntity>.of([]);
    }

    return cards
        .map(
          (card) => CardEntity(
            color: card.color,
            name: card.name,
            lastNumbers: card.lastNumbers,
            cardType: card.cardType,
          ),
        )
        .toList();
  }
}
