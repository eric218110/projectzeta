// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_field
import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/domain/value_object/value_object.dart';

sealed class ExpenseOrReceive {
  final double _value;
  final Description _description;
  final String _category;
  final String _account;
  final String _repeat;
  final String _observations;
  final String _date;
  final Operation _operationType;

  ExpenseOrReceive(
    this._value,
    this._description,
    this._category,
    this._account,
    this._repeat,
    this._observations,
    this._date,
    this._operationType,
  );
}

class Expense implements ExpenseOrReceive {
  @override
  double _value;
  @override
  Description _description;
  @override
  String _category;
  @override
  String _account;
  @override
  String _repeat;
  @override
  String _observations;
  @override
  String _date;
  @override
  Operation _operationType;

  double get value => _value;
  void setValue(double value) => _value = value;

  Description get description => _description;
  void setDescription(String value) => _description = Description(value);

  String get category => _category;
  void setCategory(String value) => _category = value;

  String get account => _account;
  void setAccount(String value) => _account = value;

  String get repeat => _repeat;
  void setRepeat(String value) => _repeat = value;

  String get observations => _observations;
  void setObservations(String value) => _observations = value;

  String get date => _date;
  void setDate(String value) => _date = value;

  Operation get operationType => _operationType;
  void setOperationType(Operation value) => _operationType = value;

  Expense._internal(
    this._value,
    this._description,
    this._category,
    this._account,
    this._repeat,
    this._observations,
    this._date,
    this._operationType,
  );

  factory Expense.empty({required String today}) {
    return Expense._internal(
      0.0,
      Description(''),
      '',
      '',
      '',
      '',
      today,
      Operation.expense,
    );
  }
}

class Receive implements ExpenseOrReceive {
  @override
  double _value;
  @override
  Description _description;
  @override
  String _category;
  @override
  String _account;
  @override
  String _repeat;
  @override
  String _observations;
  @override
  String _date;
  @override
  Operation _operationType;

  double get value => _value;
  void setValue(double value) => _value = value;

  Description get description => _description;
  void setDescription(String value) => _description = Description(value);

  String get category => _category;
  void setCategory(String value) => _category = value;

  String get account => _account;
  void setAccount(String value) => _account = value;

  String get repeat => _repeat;
  void setRepeat(String value) => _repeat = value;

  String get observations => _observations;
  void setObservations(String value) => _observations = value;

  String get date => _date;
  void setDate(String value) => _date = value;

  Operation get operationType => _operationType;
  void setOperationType(Operation value) => _operationType = value;

  Receive._internal(
    this._value,
    this._description,
    this._category,
    this._account,
    this._repeat,
    this._observations,
    this._date,
    this._operationType,
  );

  factory Receive.empty({required String today}) {
    return Receive._internal(
      0.0,
      Description(''),
      '',
      '',
      '',
      '',
      today,
      Operation.receive,
    );
  }
}
