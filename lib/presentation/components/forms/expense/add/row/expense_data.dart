import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/store/reducer/reducer.dart';
import 'package:projectzeta/presentation/theme/colors.dart';
import 'package:projectzeta/presentation/theme/dimensions.dart';
import 'package:projectzeta/utils/utils.dart';
import 'package:provider/provider.dart';

class RowExpenseData extends StatefulWidget {
  const RowExpenseData({super.key});

  @override
  State<RowExpenseData> createState() => _RowExpenseDataState();
}

class _RowExpenseDataState extends State<RowExpenseData> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final formExpenseReducer = Provider.of<FormExpenseReducer>(
        context,
        listen: false,
      );
      await formExpenseReducer.nowUsingFormat();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formExpenseReducer = Provider.of<FormExpenseReducer>(context);

    return Consumer<FormExpenseReducer>(builder: (_, state, __) {
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
                        onPress: () => {
                          formExpenseReducer.handlerOnPressPill(text),
                        },
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
