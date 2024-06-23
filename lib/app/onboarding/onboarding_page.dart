import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/screens/on_boarding/on_boarding_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return const OnBoardingScreen();
  }
}
