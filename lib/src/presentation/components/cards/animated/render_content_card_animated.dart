import 'package:flutter/material.dart';
import 'package:projectzeta/src/presentation/components/components.dart';
import 'package:projectzeta/src/presentation/theme/theme.dart';

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

  bool slideToBottom = false;

  @override
  void initState() {
    super.initState();
    color = widget.color;
    onSlideDown = widget.onSlideDown;
    onSlideUp = widget.onSlideUp;
  }

  void handlerOnVerticalDragEnd(DragEndDetails dragEndDetails) {
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

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    double initTop = DimensionApplication.base + widget.additionalTop;
    double limitTop = (deviceHeight * 0.15) + widget.additionalTop;

    double height = deviceHeight * 0.23;
    double width = deviceWidth - (DimensionApplication.horizontalPadding * 2);

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 600),
      top: slideToBottom ? limitTop : initTop,
      height: height,
      width: width,
      curve: Curves.bounceOut,
      child: GestureDetector(
        onVerticalDragEnd: handlerOnVerticalDragEnd,
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
