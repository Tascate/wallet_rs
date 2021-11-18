class Transaction {
  double money;
  String title;
  DateTime timestamp;
  bool isSpending;

  Transaction(this.money, this.isSpending, this.title, this.timestamp);
}
