import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/theme/theme.dart';
import 'package:projectzeta/utils/utils.dart';

class RowRepeat extends StatelessWidget {
  const RowRepeat({super.key});

  @override
  Widget build(BuildContext context) {
    return Select(
      icon: ProjectZetaIcons.repeatOutline(
        color: SurfaceColors.pureWhite,
      ),
      label: R.strings.repeat,
    );
  }
}
