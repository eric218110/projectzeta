import 'package:flutter/material.dart';
import 'package:projectzeta/main/di/di.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/store/form_expense/store.dart';
import 'package:projectzeta/utils/utils.dart';

class RowObservations extends StatelessWidget {
  const RowObservations({super.key});

  @override
  Widget build(BuildContext context) {
    final store = getIt<FormExpenseStore>();

    return ValueListenableBuilder(
      valueListenable: store,
      builder: (_, state, __) => InputPrimary(
        label: R.strings.observations,
        value: state.input.observations.toString(),
        onChanged: state.input.setObservations,
        prefixIcon: ProjectZetaIcons.text(),
      ),
    );
  }
}
