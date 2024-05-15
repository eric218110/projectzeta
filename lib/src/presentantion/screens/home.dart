import 'package:flutter/material.dart';
import 'package:projectzeta/src/presentantion/components/header/header.component.dart';
import 'package:projectzeta/src/presentantion/theme/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SurfaceColors.pitchBlack,
      body: const SafeArea(
        child: Header(),
      ),
    );
  }
}
