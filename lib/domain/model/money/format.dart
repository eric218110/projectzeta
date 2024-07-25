class MoneyFormatModel {
  final String money;
  final String cents;
  String? hideText;

  MoneyFormatModel({
    required this.money,
    required this.cents,
    this.hideText,
  });
}
