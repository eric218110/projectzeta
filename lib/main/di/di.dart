import 'package:get_it/get_it.dart';
import 'package:projectzeta/infra/object_box/object_box.dart';
import 'package:projectzeta/main/di/data.dart';
import 'package:projectzeta/main/di/domain.dart';
import 'package:projectzeta/main/di/infra.dart';

GetIt getIt = GetIt.instance;

Future<void> setupDependencyInjections() async {
  setupDependencyInjectionsDomain(getIt);
  setupDependencyInjectionsInfra(getIt);

  await GetIt.instance.isReady<ObjectBoxStore>();

  setupDependencyInjectionsData(getIt);
}
