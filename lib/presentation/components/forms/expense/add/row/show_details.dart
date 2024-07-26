import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/forms/expense/add/row/row.dart';
import 'package:projectzeta/presentation/store/reducer/reducer.dart';
import 'package:projectzeta/presentation/theme/dimensions.dart';
import 'package:provider/provider.dart';

class RowShowDetails extends StatelessWidget {
  const RowShowDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FormExpenseReducer>(builder: (_, state, __) {
      if (state.showDetails) {
        return const Column(
          children: [
            SizedBox(height: DimensionApplication.base),
            RowRepeat(),
            SizedBox(height: DimensionApplication.base),
            RowObservations(),
          ],
        );
      }

      return const SizedBox();
    });
  }
}
