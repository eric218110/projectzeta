import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/routes/route.dart';
import 'package:projectzeta/presentation/theme/theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ProjectZetaTheme.theme,
      routerConfig: router,
    );
  }
}
