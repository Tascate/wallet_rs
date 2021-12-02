import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:wallet_rs/pay_amount_final_screen.dart';

class SelectPay extends StatelessWidget {
  const SelectPay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
    );
    var pay = SelectPay();
    var namePlaceholder = Text(
      "Name",
      style: nameStyle,
    );

    var placeHolder2 = CircleAvatar(
      child: const Text("TBA"),
      backgroundColor: Colors.orange[400],
      radius: 64,
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
        children: [placeHolder2, namePlaceholder],
      ),
    );

    var selectionRow = Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            tilePlaceholder,
            tilePlaceholder,
            tilePlaceholder,
          ],
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
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 16, left: 12, right: 12),
            child: TextField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(), hintText: 'Search'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                selectionRow,
                selectionRow,
                selectionRow,
                selectionRow,
                selectionRow,
                selectionRow
              ],
            ),
          )
        ],
      ),
    );
  }
}
