import 'package:flutter/material.dart';
import 'package:projectzeta/domain/model/model.dart';
import 'package:projectzeta/presentation/components/cards/add/add_card.dart';
import 'package:projectzeta/presentation/components/cards/animated/render_content_card_animated.dart';
import 'package:projectzeta/presentation/theme/colors.dart';

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
    CardModel(
      color: SurfaceColors.charcoalGray,
      name: 'Fake card 1',
      lastNumbers: '1234',
      cardType: 'Credito',
    ),
    CardModel(
      color: SurfaceColors.darkSurface,
      name: 'Fake card 2',
      lastNumbers: '4567',
      cardType: 'Alimentacao',
    ),
    CardModel(
      color: SurfaceColors.slateGray,
      name: 'Fake card 3',
      lastNumbers: '8910',
      cardType: 'Debito',
    ),
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
        children: _renderChildren(),
      ),
    );
  }

  List<Widget> _renderChildren() {
    List<Widget> listWidget = [];
    listWidget.add(const AddCard());

    cardList.asMap().entries.forEach((entry) {
      var card = entry.value;
      int additionalTop = entry.key * _factorToSumAdditionHeight;

      listWidget.add(RenderContentCardAnimated(
        card: card,
        onSlideDown: _onSlideDown,
        onSlideUp: _onSlideUp,
        additionalTop: additionalTop,
      ));
    });

    return listWidget.toList();
  }
}
