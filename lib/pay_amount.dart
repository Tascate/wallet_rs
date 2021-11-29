import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:wallet_rs/confirm_screen.dart';

class PayAmount extends StatelessWidget {
  const PayAmount({Key? key, required this.name, required this.tilePlaceholder})
      : super(key: key);

  final String name;
  final Widget tilePlaceholder;

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
        ));

    var sendButton = GestureDetector(
      onTap: () {
        //process transaction
        //append transaction to list of transactions
        //go to confirm screen + pass confirm msg with success/failure value
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ConfirmationScreen(
                    confirmMessage: "\$256.25 sent to\n TBA", success: true)));
        //confirmMessage: "Failed to send", success: false)));
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
        appBar: AppBar(
          toolbarHeight: 52,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Pay to " + name,
            style: const TextStyle(
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
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 96,
            ),
            Text(
              "How much will be sent to " + name + "?",
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
            tilePlaceholder,
            SizedBox(
              height: 32,
            ),
            inputTotal,
            SizedBox(
              height: 32,
            ),
            sendButton,
          ],
        ));
  }
}
