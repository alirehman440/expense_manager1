
import 'package:expensemanager/modal/transaction/transaction.dart';
import 'package:hive_flutter/hive_flutter.dart';
class Boxes{
  static Box<Transaction> getTransactions() =>
      Hive.box('transaction');
}