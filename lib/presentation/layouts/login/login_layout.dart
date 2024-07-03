import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:projectzeta/presentation/components/components.dart';

class LoginLayout extends StatelessWidget {
  const LoginLayout({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var widthWithPadding = width * 0.05;
    var heightWithPadding = height * 0.15;

    return KeyboardDismissOnTap(
      child: KeyboardVisibilityBuilder(
        builder: (context, visible) => Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: widthWithPadding,
                  right: widthWithPadding,
                  top: visible ? 0 : heightWithPadding,
                ),
                child: const Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    LoginHeader(),
                    LoginForm(),
                    LoginFooter(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
