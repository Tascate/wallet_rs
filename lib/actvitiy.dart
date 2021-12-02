import 'dart:collection';
import 'package:flutter/cupertino.dart';

class Activity implements Comparable<Activity> {
  double money;
  String title;
  DateTime timestamp;
  bool isSpending;

  Activity(this.money, this.isSpending, this.title, this.timestamp);

  //Transactions are sorted by timestamps
  @override
  int compareTo(Activity rhs) => rhs.timestamp.compareTo(timestamp);
}

class ActivityList extends ChangeNotifier {
  final List<Activity> transactions = [];

  //Get unmodifiable view of transaction list
  UnmodifiableListView<Activity> get items =>
      UnmodifiableListView(transactions);

  //length of transactions
  int get numTransactions => transactions.length;

  //Adds transaction to list
  //The list usually sorted at runtime
  void addTransaction(
      double money, String title, DateTime timestamp, bool isSpending) {
    var newTransaction = Activity(money, isSpending, title, timestamp);
    transactions.add(newTransaction);
    transactions.sort();
    notifyListeners();
  }

  void quickAdd(Activity newTransaction) {
    transactions.add(newTransaction);
    transactions.sort();
    notifyListeners();
  }
}
