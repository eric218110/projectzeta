import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';

class LoginLayout extends StatelessWidget {
  const LoginLayout({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var widthWithPadding = width * 0.05;

    return SafeArea(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: widthWithPadding),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LoginHeader(),
              LoginForm(),
              LoginFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
