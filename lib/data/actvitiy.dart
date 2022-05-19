import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'helper.dart';

class Activity implements Comparable<Activity> {
  double amount;
  String title;
  DateTime timestamp;
  bool isSpending;

  Activity(this.amount, this.isSpending, this.title, this.timestamp);

  Activity.fromJson(Map<String, dynamic> json)
      : amount = json['amount'],
        title = json['title'],
        timestamp = DateTime.parse(json['timestamp']),
        isSpending = json['isSpending'];

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'title': title,
        'timestamp': timestamp.toIso8601String(),
        'isSpending': isSpending
      };

  //Transactions are sorted by timestamps
  @override
  int compareTo(Activity rhs) => rhs.timestamp.compareTo(timestamp);
}

class ActivityList extends ChangeNotifier {
  static final ActivityList _activityList = ActivityList._internal();

  factory ActivityList() {
    return _activityList;
  }

  ActivityList._internal() {
    buildActivityList(transactions);
    transactions.sort();
  }

  final List<Activity> transactions = [];

  //Get unmodifiable view of transaction list
  UnmodifiableListView<Activity> get items =>
      UnmodifiableListView(transactions);

  //length of transactions
  int get numTransactions => transactions.length;

  //Adds transaction to list
  Future<void> addTransaction(
      double money, String title, DateTime timestamp, bool isSpending) async {
    var newTransaction = Activity(money, isSpending, title, timestamp);
    transactions.add(newTransaction);
    transactions.sort();
    notifyListeners();
    saveToFile();
  }

  void quickAdd(Activity newTransaction) {
    transactions.add(newTransaction);
    transactions.sort();
    notifyListeners();
  }

  Future<void> saveToFile() async {
    writeActivity(transactions);
  }
}
