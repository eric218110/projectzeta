import 'package:flutter/material.dart';
import 'package:projectzeta/src/presentation/screens/home.dart';
import 'package:projectzeta/src/presentation/theme/theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ProjectZetaTheme.theme,
    );
  }
}
