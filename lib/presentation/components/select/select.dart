import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/theme/theme.dart';

class Select extends StatefulWidget {
  final Widget icon;
  final String label;

  const Select({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  State<Select> createState() => _SelectState();
}

class _SelectState extends State<Select> {
  bool showItems = false;

  _handlerOnPressItem() {
    setState(() {
      showItems = !showItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: DimensionApplication.large,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: _handlerOnPressItem,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: DimensionApplication.base,
              ),
              height: DimensionApplication.huge,
              decoration: BoxDecoration(
                border: Border.all(
                  color: showItems
                      ? PrimaryColors.deepPurple
                      : GradientColors.borderGray,
                  width: 0.5,
                ),
                borderRadius: BorderRadiusApplication.tiny.borderRadius,
              ),
              child: Row(
                children: [
                  widget.icon,
                  const SizedBox(
                    width: DimensionApplication.large,
                  ),
                  CustomText(context: context).h2(
                    text: widget.label,
                    color: showItems
                        ? SurfaceColors.pureWhite
                        : SurfaceColors.lightGray,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: showItems
                          ? ProjectZetaIcons.arrowDown()
                          : ProjectZetaIcons.arrowUp(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          showItems
              ? Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: DimensionApplication.base,
                  ),
                  height: 186,
                  child: Container(
                    child: CustomText(context: context).h2(text: "Mastercard"),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
