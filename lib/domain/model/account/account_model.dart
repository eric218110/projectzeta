class AccountModel {
  final String id;
  final String description;
  final double balance;

  AccountModel({
    required this.id,
    required this.description,
    required this.balance,
  });

  factory AccountModel.empty() {
    return AccountModel(
      id: '',
      description: '',
      balance: 0.0,
    );
  }
}
