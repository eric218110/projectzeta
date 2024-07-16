import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ConfigurationRepositoryObjectBox {
  static const String _dbName = "com-project-zeta";

  ConfigurationRepositoryObjectBox._init();

  static Future<String> create() async {
    final docsDir = await getApplicationDocumentsDirectory();

    return join(docsDir.path, _dbName);
  }
}
