import 'dart:collection';

import 'package:flutter/cupertino.dart';

class UserData extends ChangeNotifier {
  //Internal user data
  String name = "K.B.";
  double balance = 300.74;

  //TODO store in file and get from file

  double get currentBalance => balance;

  void topupBalance(double amountAdded) {
    balance += amountAdded;
    notifyListeners();
  }

  void deductBalance(double deduction) {
    balance -= deduction;
    notifyListeners();
  }
}
