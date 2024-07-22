import 'package:flutter/material.dart';
import 'package:projectzeta/main/providers/providers.dart';
import 'package:projectzeta/presentation/middleware/auth_middleware.dart';
import 'package:projectzeta/presentation/middleware/splash_middleware.dart';
import 'package:projectzeta/presentation/theme/theme.dart';
import 'package:projectzeta/routes.g.dart';
import 'package:provider/provider.dart';
import 'package:routefly/routefly.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderLoader.load(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ProjectZetaTheme.theme,
        routerConfig: Routefly.routerConfig(
          routes: routes,
          initialPath: routePaths.splash,
          middlewares: [splashMiddleware, authMiddleware],
        ),
      ),
    );
  }
}
