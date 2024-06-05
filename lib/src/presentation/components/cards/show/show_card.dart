import 'package:flutter/material.dart';
import 'package:projectzeta/src/presentation/components/cards/animated/show_content_card_animated.dart';
import 'package:projectzeta/src/presentation/components/cards/show/show_card_title.dart';

class ShowCard extends StatelessWidget {
  const ShowCard({super.key});

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        const ShowCardTitle(),
        ShowContentCardAnimated(
          deviceHeight: deviceHeight,
          deviceWidth: deviceWidth,
        ),
      ],
    );
  }
}
