import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/theme/theme.dart';
import 'package:projectzeta/utils/utils.dart';

class DashedSteps extends StatefulWidget {
  final int amountSteps;
  final void Function(int currentStep)? onPressNextItem;
  final void Function(int currentStep)? onPressBackItem;

  const DashedSteps({
    super.key,
    required this.amountSteps,
    this.onPressNextItem,
    this.onPressBackItem,
  });

  @override
  State<DashedSteps> createState() => _DashedStepsState();
}

class _DashedStepsState extends State<DashedSteps> {
  int activeIndex = 1;
  bool isDisabledTextNext = false;
  bool enableTextBack = true;

  void _handlerOnNextItem(List<int> items) {
    if (activeIndex < items.length) {
      if (widget.onPressNextItem != null) {
        widget.onPressNextItem!(activeIndex);
      }

      setState(() {
        activeIndex = activeIndex + 1;
        isDisabledTextNext = activeIndex == items.length;
      });
    }
  }

  void _handlerOnBackItem() {
    if (activeIndex > 1) {
      if (widget.onPressBackItem != null) {
        widget.onPressBackItem!(activeIndex - 1);
      }
      setState(() {
        activeIndex = activeIndex - 1;
        isDisabledTextNext = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<int> items = List<int>.generate(widget.amountSteps, (i) => i + 1);
    bool isDisabledTextSkip = activeIndex == 1;
    var width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width - 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _renderTextItem(
              R.strings.back, _handlerOnBackItem, isDisabledTextSkip),
          _renderItems(items),
          _renderTextItem(R.strings.next, () => _handlerOnNextItem(items),
              isDisabledTextNext),
        ],
      ),
    );
  }

  Widget _renderTextItem(
      String text, void Function() onPressed, bool isDisabled) {
    return SizedBox(
      height: DimensionApplication.extraExtraExtraLarge,
      child: TextButton(
        style: _defaultStyle(),
        onPressed: isDisabled ? null : onPressed,
        child: Container(
          alignment: AlignmentDirectional.center,
          constraints: const BoxConstraints(
            minWidth: DimensionApplication.colossal + 4,
            minHeight: DimensionApplication.colossal + 4,
          ),
          child: CustomText(context: context).h2(
            text: text,
            color:
                isDisabled ? SurfaceColors.darkGray : SurfaceColors.nearWhite,
          ),
        ),
      ),
    );
  }

  Widget _renderItems(List<int> items) {
    return SizedBox(
      child: Row(
        children: items
            .map(
              (item) => _renderItem(item == activeIndex, item == items.length),
            )
            .toList(),
      ),
    );
  }

  Widget _renderItem(bool isActive, bool isLast) {
    return Padding(
      padding: EdgeInsets.only(
        right: isLast ? 0 : 8.0,
      ),
      child: Container(
        height: DimensionApplication.small,
        width: DimensionApplication.extraLarge,
        decoration: BoxDecoration(
          color: isActive
              ? PrimaryColors.deepPurple
              : PrimaryColors.deepPurpleDisabled,
          borderRadius: BorderRadius.circular(
            DimensionApplication.small,
          ),
        ),
      ),
    );
  }

  ButtonStyle _defaultStyle() {
    return TextButton.styleFrom(
      backgroundColor: GradientColors.transparent,
      minimumSize: const Size(20, 100),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 0,
        horizontal: DimensionApplication.extraLarge,
      ),
    );
  }
}
