import 'dart:collection';

import 'package:flutter/cupertino.dart';

class User extends ChangeNotifier {
  //User data
  //TODO store in file and get from file
  String firstName;
  String lastName;
  double balance;

  User(this.firstName, this.lastName, this.balance);

  User.fromJson(Map<String, dynamic> json)
      : firstName = json['firstName'],
        lastName = json['lastName'],
        balance = json['balance'];

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'balance': balance,
      };

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

class Contact {
  String name;
  int userID;

  Contact(this.name, this.userID);

  Contact.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        userID = json['userID'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'userID': userID,
      };

  int get id => userID;
  String get contactName => name;
}
