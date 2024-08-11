import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/store/reducer/reducer.dart';
import 'package:projectzeta/utils/utils.dart';
import 'package:provider/provider.dart';

class RowObservations extends StatelessWidget {
  const RowObservations({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FormExpenseReducer>(
      builder: (_, state, __) => InputPrimary(
        label: R.strings.observations,
        value: state.input.observations.toString(),
        onChanged: state.input.setObservations,
        prefixIcon: ProjectZetaIcons.text(),
      ),
    );
  }
}
