import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';

class MenuAndBell extends StatelessWidget {
  const MenuAndBell({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProjectZetaIcons.menu(),
        ProjectZetaIcons.bell(),
      ],
    );
  }
}
