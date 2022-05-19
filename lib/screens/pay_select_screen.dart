import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:wallet_rs/data/user.dart';
import 'package:wallet_rs/screens/pay_amount_final_screen.dart';

class SelectPay extends StatelessWidget {
  const SelectPay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Contact c0 = Contact("Mary", 0);
    Contact c1 = Contact("Sam", 1);
    Contact c2 = Contact("Gary", 2);
    Contact c3 = Contact("Allyson", 3);
    Contact c4 = Contact("Macie", 4);
    Contact c5 = Contact("Henry", 5);
    Contact c6 = Contact("Ellie ", 6);
    Contact c7 = Contact("Audrey", 7);
    Contact c8 = Contact("Alex", 8);
    Contact c9 = Contact("Coby", 9);
    List contactList = <Contact>[c0, c1, c2, c3, c4, c5, c6, c7, c8, c9];

    var nameStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
    );

    var placeHolder2 = CircleAvatar(
      child: Text(c1.name),
      backgroundColor:
          Colors.primaries[Random().nextInt(Colors.primaries.length)],
      radius: 56,
    );

    var tilePlaceholder = GestureDetector(
      onTap: () {
        //TODO: Navigate to next page
        //Send payee info
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PayAmount(
                    name: "TBA",
                    profilePicture: Hero(tag: "TBA", child: placeHolder2))));
      },
      child: Column(
        children: [placeHolder2, Text(c1.name)],
      ),
    );

    var selectionRow = Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [tilePlaceholder, tilePlaceholder, tilePlaceholder],
        ));

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 52,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Pay to",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        backgroundColor: Color(0xff4AB94A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(22),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      // body: ListView(
      //   children: [
      //     // const Padding(
      //     //   padding: EdgeInsets.only(top: 16, left: 12, right: 12),
      //     //   child: TextField(
      //     //     decoration: InputDecoration(
      //     //         border: UnderlineInputBorder(), hintText: 'Search'),
      //     //   ),
      //     // ),
      //     Padding(
      //       padding: const EdgeInsets.symmetric(vertical: 16),
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: [
      //           selectionRow,
      //           selectionRow,
      //           selectionRow,
      //           selectionRow,
      //           selectionRow,
      //           selectionRow
      //         ],
      //       ),
      //     )
      //   ],
      // ),
      body: ListView.builder(
        itemCount: ((contactList.length - 1) ~/ 3) + 1,
        itemBuilder: (BuildContext context, int index) {
          return buildContactRow(context, contactList, index);
        },
      ),
    );
  }

  Widget buildContactRow(var context, List contactList, int index) {
    Widget emptySpace = const Visibility(
      child: CircleAvatar(
        radius: 56,
      ),
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      visible: false,
    );

    var array = [emptySpace, emptySpace, emptySpace];

    int startIndex = ((index + 1) * 3) - 3;

    for (int i = 0; i < 3 && startIndex < contactList.length; i++) {
      if (startIndex + i < contactList.length) {
        array[i] =
            buildContactAvatar(context, contactList.elementAt(startIndex + i));
      }
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: array,
      ),
    );
  }

  Widget buildContactAvatar(var context, Contact contact) {
    var avatar = CircleAvatar(
      child: Text(contact.name),
      backgroundColor:
          Colors.primaries[Random().nextInt(Colors.primaries.length)],
      radius: 56,
    );

    return GestureDetector(
      onTap: () {
        //TODO: Navigate to next page
        //Send payee info
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PayAmount(
                    name: contact.name,
                    profilePicture: Hero(tag: contact.name, child: avatar))));
      },
      child: Column(
        children: [avatar, Text(contact.name)],
      ),
    );
  }
}
