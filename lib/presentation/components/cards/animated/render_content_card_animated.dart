import 'package:flutter/material.dart';
import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/presentation/components/circle/circle.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/components/painters/card/default_symbol_card.dart';
import 'package:projectzeta/presentation/theme/theme.dart';

class RenderContentCardAnimated extends StatefulWidget {
  final CardModel card;
  final VoidCallback onSlideDown;
  final VoidCallback onSlideUp;
  final int additionalTop;

  const RenderContentCardAnimated({
    super.key,
    required this.card,
    required this.onSlideDown,
    required this.onSlideUp,
    required this.additionalTop,
  });

  @override
  State<RenderContentCardAnimated> createState() =>
      _RenderContentCardAnimatedState();
}

class _RenderContentCardAnimatedState extends State<RenderContentCardAnimated> {
  late final CardModel card;
  late final VoidCallback onSlideDown;
  late final VoidCallback onSlideUp;

  late bool slideToBottom = false;
  late bool slideToLeft = false;

  @override
  void initState() {
    super.initState();
    card = widget.card;
    onSlideDown = widget.onSlideDown;
    onSlideUp = widget.onSlideUp;
  }

  void _handlerOnVerticalDragEnd(DragEndDetails dragEndDetails) {
    if (dragEndDetails.primaryVelocity! < 0 && slideToBottom) {
      setState(() {
        slideToBottom = false;
      });
      onSlideUp();
    } else if (dragEndDetails.primaryVelocity! > 0 && !slideToBottom) {
      setState(() {
        slideToBottom = true;
      });
      onSlideDown();
    }
  }

  void _handlerOnHorizontalDragEnd(DragEndDetails dragEndDetails) {
    if (dragEndDetails.primaryVelocity! < 0 && !slideToLeft) {
      setState(() {
        slideToLeft = true;
      });
    } else if (dragEndDetails.primaryVelocity! > 0 && slideToLeft) {
      setState(() {
        slideToLeft = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    double initTop = DimensionApplication.base + widget.additionalTop;
    double limitTop = (deviceHeight * 0.15) + widget.additionalTop;

    double initLeft = DimensionApplication.horizontalPadding;
    double limitLeft = deviceWidth * 0.87;

    double height = deviceHeight * 0.23;
    double width = deviceWidth - (DimensionApplication.horizontalPadding * 2);

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 600),
      top: slideToBottom ? limitTop : initTop,
      right: slideToLeft ? limitLeft : initLeft,
      height: height,
      width: width,
      curve: Curves.bounceOut,
      child: GestureDetector(
        onVerticalDragEnd: _handlerOnVerticalDragEnd,
        onHorizontalDragEnd: _handlerOnHorizontalDragEnd,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            DimensionApplication.large,
          ),
          child: CustomPaint(
            painter: PlaceholderCardPainter(color: card.color),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: DimensionApplication.large,
                vertical: DimensionApplication.extraLarge,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomPaint(
                    painter: DefaultSymbolCard(color: card.color),
                  ),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _renderDotsWithCardNumber(),
                            CustomText(context: context)
                                .bodyMedium(text: card.name),
                          ],
                        ),
                        CustomText(context: context).h3(text: card.cardType),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _renderDotsWithCardNumber() {
    return Row(
      children: [
        const Circle(),
        const SizedBox(
          width: DimensionApplication.extraSmall,
        ),
        const Circle(),
        const SizedBox(
          width: DimensionApplication.extraSmall,
        ),
        const Circle(),
        const SizedBox(
          width: DimensionApplication.extraSmall,
        ),
        const Circle(),
        const SizedBox(width: DimensionApplication.medium),
        CustomText(context: context).h3(
          text: card.lastNumbers,
        ),
      ],
    );
  }
}
