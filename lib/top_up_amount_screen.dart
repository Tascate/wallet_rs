import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:wallet_rs/confirm_screen.dart';

class TopUpAmount extends StatefulWidget {
  const TopUpAmount({Key? key, required this.topUpIconChoice})
      : super(key: key);
  final Widget topUpIconChoice;

  @override
  _TopUpAmountState createState() => _TopUpAmountState();
}

class _TopUpAmountState extends State<TopUpAmount> {
  final amountController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget inputTotal = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.attach_money_rounded),
          hintText: "0",
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp('[0-9,.]')),
        ],
        controller: amountController,
      ),
    );

    var nextButton = GestureDetector(
      onTap: () {
        //process top-up transaction
        //append top-up transaction to list of transactions
        //go to confirm screen + pass confirm msg with success/failure value
        String amount = amountController.text;

        Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute(
            builder: (context) => ConfirmationScreen(
                confirmMessage: "\$$amount\n added to balance", success: true),
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
          "Send",
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
        ),
        preferredSize: AppBar().preferredSize,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 96),
          Text(
            "How much to Top-up?",
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
          SizedBox(height: 32),
          widget.topUpIconChoice,
          SizedBox(height: 32),
          inputTotal,
          SizedBox(height: 32),
          nextButton,
        ],
      ),
    );
  }
}