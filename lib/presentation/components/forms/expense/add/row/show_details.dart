import 'package:flutter/material.dart';
import 'package:projectzeta/main/di/di.dart';
import 'package:projectzeta/presentation/components/forms/expense/add/row/row.dart';
import 'package:projectzeta/presentation/store/form_expense/store.dart';
import 'package:projectzeta/presentation/theme/dimensions.dart';

class RowShowDetails extends StatelessWidget {
  const RowShowDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final store = getIt<FormExpenseStore>();

    return ValueListenableBuilder(
        valueListenable: store,
        builder: (_, state, __) {
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
