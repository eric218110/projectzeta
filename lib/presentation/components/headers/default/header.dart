import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/icons/icons.dart';
import 'package:projectzeta/presentation/theme/dimensions.dart';

class Header extends StatelessWidget {
  final bool isGoBack;
  final String title;

  const Header({
    super.key,
    this.isGoBack = false,
    this.title = '',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: DimensionApplication.huge,
        left: DimensionApplication.horizontalPadding,
        right: DimensionApplication.horizontalPadding,
        bottom: DimensionApplication.extraLarge,
      ),
      child: isGoBack ? _rowWithGoBackAndTitle(context) : _rowWithMenuAndBell(),
    );
  }

  Widget _rowWithMenuAndBell() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProjectZetaIcons.menu(),
        ProjectZetaIcons.bell(),
      ],
    );
  }

  Widget _rowWithGoBackAndTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ProjectZetaIcons.arrowLeft(),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontSize: DimensionApplication.large),
        ),
        const SizedBox(
          width: 12,
        ),
      ],
    );
  }
}
