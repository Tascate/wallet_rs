import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:wallet_rs/confirm_screen.dart';
import 'package:wallet_rs/user.dart';

class TransferFinal extends StatelessWidget {
  const TransferFinal(
      {Key? key, required this.amount, required this.transferChoiceCard})
      : super(key: key);
  final String amount;
  final Widget transferChoiceCard;

  @override
  Widget build(BuildContext context) {
    var nextButton = GestureDetector(
      onTap: () {
        //TODO process top-up transaction
        //TODO append top-up transaction to list of transactions
        //TODO go to confirm screen + pass confirm msg with success/failure value

        Provider.of<UserData>(context, listen: false)
            .deductBalance(double.parse(amount));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ConfirmationScreen(
                confirmMessage: "\$$amount\n transferred", success: true),
            //confirmMessage: "Failed to top-up", success: false),
          ),
        );
      },
      child: Container(
        height: 40,
        width: double.maxFinite,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(22)),
        ),
        child: const Text(
          "Confirm Transfer",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
    );

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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 96),
          Text(
            "\$$amount \n will be transferred.",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 32),
          transferChoiceCard,
          const SizedBox(height: 32),
          nextButton,
        ],
      ),
    );
  }
}
