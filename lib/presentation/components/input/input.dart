import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/theme/theme.dart';

class InputWithIcon extends StatelessWidget {
  final Widget prefixIcon;
  final String label;
  final TextInputType? keyboardType;

  const InputWithIcon({
    super.key,
    required this.prefixIcon,
    required this.label,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText:
          keyboardType != null && keyboardType == TextInputType.visiblePassword,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        fillColor: SurfaceColors.pitchBlack,
        labelText: label,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(DimensionApplication.medium),
          child: prefixIcon,
        ),
        labelStyle: TextStyle(
          color: SurfaceColors.lightGray,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: SurfaceColors.darkGray,
            width: 1,
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
    );
  }
}
