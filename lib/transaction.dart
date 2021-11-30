import 'dart:collection';
import 'package:flutter/cupertino.dart';

class Transaction implements Comparable<Transaction> {
  double money;
  String title;
  DateTime timestamp;
  bool isSpending;

  Transaction(this.money, this.isSpending, this.title, this.timestamp);

  @override
  int compareTo(Transaction rhs) => timestamp.compareTo(rhs.timestamp);
}

class TransactionModel extends ChangeNotifier {
  final List<Transaction> transactions = [];

  //Get unmodifiable view of transaction list
  UnmodifiableListView<Transaction> get items =>
      UnmodifiableListView(transactions);

  //length of transactions
  int get numTransactions => transactions.length;

  void addTransaction(
      double money, String title, DateTime timestamp, bool isSpending) {
    var newTransaction = Transaction(money, isSpending, title, timestamp);
    transactions.add(newTransaction);
    transactions.sort();
    notifyListeners();
  }

  void quickAdd(Transaction newTransaction) {
    transactions.add(newTransaction);
    transactions.sort();
    notifyListeners();
  }
}
