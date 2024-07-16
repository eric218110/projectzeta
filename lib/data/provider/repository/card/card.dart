import 'package:projectzeta/data/data.dart';

abstract class CardRepository {
  Future<List<CardEntity>> loadAllCardByUserId(String userId);
}
