import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/components/select/box_select.dart';
import 'package:projectzeta/presentation/theme/theme.dart';

class Select<OptionType> extends StatefulWidget {
  final Widget icon;
  final String label;
  final Widget child;
  final void Function()? onPress;

  const Select({
    super.key,
    required this.icon,
    required this.label,
    required this.child,
    this.onPress,
  });

  @override
  State<Select> createState() => SelectState<OptionType>();
}

class SelectState<Item> extends State<Select> {
  bool showItems = false;
  bool isSelectedOption = false;
  String selectedOptionText = '';

  _handlerOnPressItem() {
    setState(() {
      selectedOptionText = '';
      isSelectedOption = false;
      showItems = !showItems;
    });
    if (widget.onPress != null) {
      widget.onPress!();
    }
  }

  handlerOnPressItem(String option) {
    _handlerOnPressItem();
    setState(() {
      selectedOptionText = option;
      isSelectedOption = true;
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
            child: BoxSelect(
              isSelectedOption: isSelectedOption,
              showItems: showItems,
              child: Row(
                children: [
                  widget.icon,
                  const SizedBox(
                    width: DimensionApplication.large,
                  ),
                  LabelText(
                    isSelectedOption: isSelectedOption,
                    label: widget.label,
                    selectedOptionText: selectedOptionText,
                    showItems: showItems,
                  ),
                  IconArrows(show: showItems, isPrimary: isSelectedOption)
                ],
              ),
            ),
          ),
          showItems ? widget.child : const SizedBox(),
        ],
      ),
    );
  }
}
