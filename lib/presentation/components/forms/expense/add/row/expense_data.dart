import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/store/reducer/reducer.dart';
import 'package:projectzeta/presentation/theme/colors.dart';
import 'package:projectzeta/presentation/theme/dimensions.dart';
import 'package:projectzeta/utils/utils.dart';

class RowExpenseData extends StatefulWidget {
  const RowExpenseData({super.key});

  @override
  State<RowExpenseData> createState() => _RowExpenseDataState();
}

class _RowExpenseDataState extends State<RowExpenseData> {
  final _formExpenseReducer = FormExpenseReducer();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _formExpenseReducer.nowUsingFormat();
    });

    _formExpenseReducer.addListener(_update);
    super.initState();
  }

  @override
  void dispose() {
    _formExpenseReducer.removeListener(_update);
    super.dispose();
  }

  void _update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                text: _formExpenseReducer.state.today,
              ),
            ],
          ),
          Row(
            children: _formExpenseReducer.pills
                .map(
                  (text) => Padding(
                    padding: const EdgeInsets.only(
                      right: DimensionApplication.extraSmall,
                    ),
                    child: PillsButton(
                      text: text,
                      onPress: () => {
                        _formExpenseReducer.handlerOnPressPill(text),
                      },
                      isActive: text == _formExpenseReducer.state.activePill,
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: DimensionApplication.smallLarge),
          GestureDetector(
            onTap: _formExpenseReducer.handlerOnToggleDetails,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: DimensionApplication.mediumTiny,
                horizontal: DimensionApplication.base,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(context: context).h1(
                    text: R.strings.details,
                    color: SurfaceColors.lightGray,
                  ),
                  const SizedBox(width: DimensionApplication.base),
                  _formExpenseReducer.state.showDetail
                      ? ProjectZetaIcons.arrowUp(
                          color: SurfaceColors.lightGray,
                        )
                      : ProjectZetaIcons.arrowDown(
                          color: SurfaceColors.lightGray,
                        )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
