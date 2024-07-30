import 'package:flutter/material.dart';
import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/theme/theme.dart';

class SelectItemsListString<T extends dynamic> extends StatelessWidget {
  final List<ItemsKeyValue> items;
  final void Function(T) onPress;

  const SelectItemsListString({
    super.key,
    required this.items,
    required this.onPress,
  });

  _handlerOnChangedSearchInput(String text) {}

  _handlerOnSearchInput() {}

  _handlerPressOption(T option) {
    onPress(option);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: DimensionApplication.tiny,
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(DimensionApplication.base),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusApplication.tiny.borderRadius,
          border: Border.all(
            color: PrimaryColors.deepPurple,
            width: 0.5,
          ),
        ),
        child: Column(
          children: [
            InputSearch(
              onChanged: _handlerOnChangedSearchInput,
              onSearch: _handlerOnSearchInput,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 100,
              ),
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (_, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: DimensionApplication.extraSmall),
                      GestureDetector(
                        onTap: () {
                          _handlerPressOption(items[index] as T);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: DimensionApplication.small,
                            horizontal: DimensionApplication.base,
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadiusApplication.tiny.borderRadius,
                            border: Border.all(
                              color: GradientColors.borderGray,
                              width: 0.5,
                            ),
                          ),
                          child: CustomText(context: context).h2(
                            text: items[index].value,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
