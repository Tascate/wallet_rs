import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class selectPay extends StatelessWidget {
  const selectPay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameStyle = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
    );
    var namePlaceholder = Text(
      "Name",
      style: nameStyle,
    );
    var placeHolder = SizedBox(height: 80, width: 80, child: Placeholder());
    var selectionRow = Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [placeHolder, namePlaceholder],
            ),
            Column(
              children: [placeHolder, namePlaceholder],
            ),
            Column(
              children: [placeHolder, namePlaceholder],
            )
          ],
        ));
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 52,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Pay to...",
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
