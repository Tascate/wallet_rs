import 'package:flutter/material.dart';

class TopUpChoose extends StatelessWidget {
  const TopUpChoose({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var placeholderIcon = Icons.account_balance;
    var choiceCard = GestureDetector(
        onTap: () {
          //go to details page
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 128,
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(22)),
                color: Colors.lightBlue,
              ),
            ),
            Icon(
              placeholderIcon,
              size: 128,
            )
          ],
        ));

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 52,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Top-up",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        backgroundColor: Color(0xff4AB94A),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(22),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [choiceCard],
      ),
    );
  }
}
