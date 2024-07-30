import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/theme/theme.dart';

class InputPrimary extends StatelessWidget {
  final Widget prefixIcon;
  final String value;
  final String label;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool? isFilled;

  const InputPrimary({
    super.key,
    required this.prefixIcon,
    required this.label,
    required this.value,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.isFilled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DimensionApplication.huge,
      padding: const EdgeInsets.symmetric(
        horizontal: DimensionApplication.large,
      ),
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        obscureText: keyboardType != null &&
            keyboardType == TextInputType.visiblePassword,
        keyboardType: keyboardType,
        style: TextStyle(
          color: SurfaceColors.pureWhite,
          fontSize: DimensionApplication.smallLarge,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 50,
          ),
          fillColor: SurfaceColors.pitchBlack,
          labelText: label,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(DimensionApplication.small),
            child: prefixIcon,
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
              color: isFilled != null && isFilled!
                  ? PrimaryColors.deepPurple
                  : GradientColors.borderGray,
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
