import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/theme/theme.dart';
import 'package:projectzeta/utils/utils.dart';

class CategoryExpense extends StatelessWidget {
  const CategoryExpense({super.key});

  @override
  Widget build(BuildContext context) {
    return Select(
      icon: ProjectZetaIcons.moneySend(
        color: SurfaceColors.pureWhite,
      ),
      label: R.strings.category,
    );
  }
}
