import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/theme/colors.dart';
import 'package:projectzeta/presentation/theme/dimensions.dart';
import 'package:projectzeta/utils/utils.dart';

class InputSearch extends StatelessWidget {
  final void Function(String) onChanged;
  final void Function() onSearch;

  const InputSearch({
    super.key,
    required this.onChanged,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DimensionApplication.huge,
      child: TextFormField(
        onChanged: onChanged,
        style: TextStyle(
          color: SurfaceColors.pureWhite,
          fontSize: DimensionApplication.smallLarge,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            left: DimensionApplication.medium,
            right: DimensionApplication.medium,
          ),
          fillColor: SurfaceColors.pitchBlack,
          hintText: R.strings.hintTextInputSearch,
          suffixIcon: SizedBox(
            width: DimensionApplication.tiny,
            child: IconButton(
              icon: ProjectZetaIcons.search(),
              onPressed: onSearch,
            ),
          ),
          labelStyle: TextStyle(
            color: SurfaceColors.lightGray,
            fontSize: DimensionApplication.smallLarge,
            fontWeight: FontWeight.w600,
          ),
          floatingLabelStyle: TextStyle(
            color: PrimaryColors.deepPurple,
            fontWeight: FontWeight.w600,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: GradientColors.borderGray,
              width: 0.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: PrimaryColors.deepPurple,
              width: 1,
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
