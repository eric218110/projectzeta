import 'package:get_it/get_it.dart';
import 'package:projectzeta/infra/object_box/object_box.dart';
import 'package:projectzeta/main/di/layers/layer.dart';

GetIt getIt = GetIt.instance;

Future<void> setupDependencyInjections() async {
  setupDependencyInjectionsDomain(getIt);
  setupDependencyInjectionsInfra(getIt);

  await GetIt.instance.isReady<ObjectBoxStore>();

  setupDependencyInjectionsData(getIt);
  setupDependencyInjectionsPresentation(getIt);
}
