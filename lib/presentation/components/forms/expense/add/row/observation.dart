import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/theme/theme.dart';
import 'package:projectzeta/utils/utils.dart';

class RowObservations extends StatelessWidget {
  const RowObservations({super.key});

  @override
  Widget build(BuildContext context) {
    return Select(
      icon: ProjectZetaIcons.list(
        color: SurfaceColors.pureWhite,
      ),
      label: R.strings.observations,
    );
  }
}
