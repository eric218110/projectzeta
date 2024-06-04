import 'package:flutter/material.dart';
import 'package:projectzeta/src/domain/model/model.dart';
import 'package:projectzeta/src/presentation/components/cards/animated/render_content_card_animated.dart';

class ShowContentCardAnimated extends StatefulWidget {
  final double deviceWidth;
  final double deviceHeight;

  const ShowContentCardAnimated({
    super.key,
    required this.deviceWidth,
    required this.deviceHeight,
  });

  @override
  State<ShowContentCardAnimated> createState() =>
      _ShowContentCardAnimatedState();
}

class _ShowContentCardAnimatedState extends State<ShowContentCardAnimated> {
  late final double deviceWidth;
  late final double deviceHeight;
  late final double _sumAdditionalTop;
  final int _factorToSumAdditionHeight = 10;
  final int _hasItemNotScrolled = 0;
  final int _hasItemScrolled = 1;

  late double _initHeightState;
  late int _itemScrolledCount = 0;
  late double _height = 0;

  final List<CardModel> cardList = [
    CardModel(color: Colors.pink),
    CardModel(color: Colors.green),
    CardModel(color: Colors.blueAccent),
  ];

  @override
  void initState() {
    super.initState();
    deviceHeight = widget.deviceHeight;
    deviceWidth = widget.deviceWidth;

    _sumAdditionalTop = _loadSumAdditionTopEntries();
    _height = deviceHeight * 0.24 + _sumAdditionalTop;
    _initHeightState = deviceHeight * 0.24 + _sumAdditionalTop;
  }

  void _onSlideDown() {
    setState(() {
      if (_itemScrolledCount == _hasItemNotScrolled) {
        _height += deviceHeight * 0.15;
      }
      _itemScrolledCount++;
    });
  }

  void _onSlideUp() {
    setState(() {
      if (_itemScrolledCount == _hasItemScrolled) {
        _height = _initHeightState;
      }
      _itemScrolledCount--;
    });
  }

  double _loadSumAdditionTopEntries() {
    return cardList.asMap().entries.fold(0.0, (previousValue, entry) {
      double additionalTop = entry.key * 10.0;
      return previousValue + additionalTop;
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      width: deviceWidth,
      height: _height,
      curve: Curves.bounceOut,
      child: Stack(
        fit: StackFit.expand,
        children: _renderChildrens(),
      ),
    );
  }

  List<Widget> _renderChildrens() {
    return cardList.asMap().entries.map((entry) {
      Color color = entry.value.color;
      int additionalTop = entry.key * _factorToSumAdditionHeight;

      return RenderContentCardAnimated(
        color: color,
        onSlideDown: _onSlideDown,
        onSlideUp: _onSlideUp,
        additionalTop: additionalTop,
      );
    }).toList();
  }
}
