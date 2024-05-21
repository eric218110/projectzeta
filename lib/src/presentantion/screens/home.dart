import 'package:flutter/material.dart';
import 'package:projectzeta/src/presentantion/components/header/header.component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Header(),
      ),
    );
  }
}
