import 'package:projectzeta/infra/object_box/configuration/configuration.dart';
import 'package:projectzeta/objectbox.g.dart';

class ObjectBoxStore {
  final Store _store;

  ObjectBoxStore._init(this._store);

  Store get store => _store;

  static Future<ObjectBoxStore> create() async {
    var configuration = await ConfigurationRepositoryObjectBox.create();
    final store = await openStore(directory: configuration);

    return ObjectBoxStore._init(store);
  }
}
