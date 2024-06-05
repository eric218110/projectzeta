import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/theme/theme.dart';

class RenderContentCardAnimated extends StatefulWidget {
  final Color color;
  final VoidCallback onSlideDown;
  final VoidCallback onSlideUp;
  final int additionalTop;

  const RenderContentCardAnimated({
    super.key,
    required this.color,
    required this.onSlideDown,
    required this.onSlideUp,
    required this.additionalTop,
  });

  @override
  State<RenderContentCardAnimated> createState() =>
      _RenderContentCardAnimatedState();
}

class _RenderContentCardAnimatedState extends State<RenderContentCardAnimated> {
  late final Color color;
  late final VoidCallback onSlideDown;
  late final VoidCallback onSlideUp;

  late bool slideToBottom = false;
  late bool slideToLeft = false;

  @override
  void initState() {
    super.initState();
    color = widget.color;
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
          borderRadius: BorderRadius.circular(16),
          child: CustomPaint(
            painter: PlaceholderCardPainter(color: color),
          ),
        ),
      ),
    );
  }
}
