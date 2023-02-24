

import 'package:hive/hive.dart';
part 'transaction.g.dart';

enum  TransactionType{
  income,
  expense,
  transfer
}


@HiveType(typeId: 0)
class Transaction extends HiveObject{
  @HiveField(0)
  late DateTime dateTime;

  @HiveField(1,defaultValue: 0.0)
  late double amount;

  @HiveField(2)
  late String currency;

  @HiveField(3,defaultValue: "")
   String? subCurrency;

  @HiveField(4,defaultValue: "")
   String? note;

  @HiveField(5)
  late String category;

  @HiveField(6,defaultValue: TransactionType.expense)
   TransactionType? transactionType;

  @HiveField(7,defaultValue: "")
   String? image;

  @HiveField(8,defaultValue: "")
   String? payee;

  @HiveField(9,defaultValue: false)
   bool recurrence;

  Transaction(
  {
    required this.dateTime,
    required this.amount,
    required this.category,
    required this.currency,
    required this.transactionType,
    this.note,
    this.recurrence =false,
    this.subCurrency,
    this.payee
});

}