import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/utils/utils.dart';

class RowInputDescription extends StatelessWidget {
  const RowInputDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return InputPrimary(
      label: R.strings.description,
      value: "",
      prefixIcon: ProjectZetaIcons.text(),
    );
  }
}
