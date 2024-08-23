import 'package:flutter/material.dart';
import 'package:projectzeta/main/di/di.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/store/form_expense/store.dart';
import 'package:projectzeta/presentation/theme/colors.dart';
import 'package:projectzeta/presentation/theme/dimensions.dart';
import 'package:projectzeta/utils/utils.dart';

class RowExpenseDate extends StatefulWidget {
  const RowExpenseDate({super.key});

  @override
  State<RowExpenseDate> createState() => _RowExpenseDataState();
}

class _RowExpenseDataState extends State<RowExpenseDate> {
  final store = getIt<FormExpenseStore>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await store.nowUsingFormat();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: store,
        builder: (_, state, __) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: DimensionApplication.large,
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(context: context).h1(
                      text: R.strings.date,
                      color: SurfaceColors.lightGray,
                    ),
                    const SizedBox(
                      width: DimensionApplication.base,
                    ),
                    Circle(
                      diameter: DimensionApplication.extraSmall,
                      borderWidth: DimensionApplication.extraSmall,
                      color: SurfaceColors.lightGray,
                    ),
                    const SizedBox(
                      width: DimensionApplication.base,
                    ),
                    CustomText(context: context).h1(
                      text: state.input.date,
                    ),
                  ],
                ),
                Row(
                  children: state.pills
                      .map(
                        (text) => Padding(
                          padding: const EdgeInsets.only(
                            right: DimensionApplication.extraSmall,
                          ),
                          child: PillsButton(
                            text: text,
                            onPress: () => {store.handlerOnPressPill(text)},
                            isActive: text == state.activePill,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          );
        });
  }
}
