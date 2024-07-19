import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/theme/theme.dart';
import 'package:routefly/routefly.dart';

class WithGoBack extends StatelessWidget {
  final String title;

  const WithGoBack({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Routefly.pop(context);
          },
          child: ProjectZetaIcons.arrowLeft(),
        ),
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
