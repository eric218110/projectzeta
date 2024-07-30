import 'package:flutter/material.dart';
import 'package:projectzeta/domain/model/components/components.dart';
import 'package:projectzeta/presentation/components/components.dart';

class OptionsItemList<T> extends StatelessWidget {
  final List<ItemsKeyValue> items;
  final void Function(T) onPress;

  const OptionsItemList({
    super.key,
    required this.onPress,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return SelectItemsListString(
      items: items,
      onPress: onPress,
    );
  }
}
