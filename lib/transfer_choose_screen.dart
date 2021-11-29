import 'package:flutter/material.dart';
import 'package:wallet_rs/transfer_final_screen.dart';
import 'confirm_screen.dart';

class TransferChoose extends StatelessWidget {
  const TransferChoose({Key? key, required this.amount}) : super(key: key);
  final String amount;

  @override
  Widget build(BuildContext context) {
    var placeholderIcon = Icons.account_balance;
    var iconCard = Hero(
        tag: 0,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 128,
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(22)),
                color: Colors.grey[200],
              ),
            ),
            Icon(
              placeholderIcon,
              size: 128,
            )
          ],
        ));

    var buttonCard = GestureDetector(
        onTap: () {
          //go to top-up amount page
          //TODO go to confirm screen + pass confirm msg with success/failure value
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  TransferFinal(amount: amount, transferChoiceCard: iconCard),
              //confirmMessage: "Failed to top-up", success: false),
            ),
          );
        },
        child: iconCard);

    return Scaffold(
      appBar: PreferredSize(
        child: Hero(
          tag: AppBar,
          child: AppBar(
            toolbarHeight: 52,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              "Transfer",
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
        ),
        preferredSize: AppBar().preferredSize,
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text(
            "Where to transfer \$$amount to?",
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
          SizedBox(height: 16),
          buttonCard
        ],
      ),
    );
  }
}
