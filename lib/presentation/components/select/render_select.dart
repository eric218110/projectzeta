import 'package:flutter/material.dart';
import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/theme/theme.dart';

class Select<OptionType> extends StatefulWidget {
  final Widget icon;
  final String label;
  final void Function(OptionType) onPressOption;

  const Select({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressOption,
  });

  @override
  State<Select> createState() => _SelectState<OptionType>();
}

class _SelectState<Item> extends State<Select> {
  bool showItems = false;

  _handlerOnPressItem() {
    setState(() {
      showItems = !showItems;
    });
  }

  _handlerOnPressItemSelect(Item item) {
    setState(() {
      showItems = !showItems;
    });
    widget.onPressOption(item);
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
              ? RenderItems(
                  onPress: _handlerOnPressItemSelect,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class RenderItems<T> extends StatelessWidget {
  final void Function(T) onPress;
  const RenderItems({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return SelectItemsListString(
      items: [
        ItemsKeyValue(key: 'mastercard', value: 'Mastercard'),
        ItemsKeyValue(key: 'visa', value: 'Visa'),
        ItemsKeyValue(key: 'hipercard', value: 'Hipercard'),
        ItemsKeyValue(key: 'ben', value: 'Ben'),
      ],
      onPress: onPress,
    );
  }
}
