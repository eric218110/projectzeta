import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/store/reducer/reducer.dart';
import 'package:projectzeta/utils/utils.dart';
import 'package:provider/provider.dart';

class RowInputDescription extends StatelessWidget {
  const RowInputDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FormExpenseReducer>(
      builder: (_, state, __) => InputPrimary(
        label: R.strings.description,
        value: state.input.description.toString(),
        onChanged: state.input.setDescription,
        prefixIcon: ProjectZetaIcons.text(),
        isFilled: state.input.description.toString() != '',
      ),
    );
  }
}
