import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:wallet_rs/confirm_screen.dart';
import 'package:wallet_rs/transfer_choose_screen.dart';

class TransferAmount extends StatefulWidget {
  TransferAmount({Key? key}) : super(key: key);

  @override
  _TransferAmountState createState() => _TransferAmountState();
}

class _TransferAmountState extends State<TransferAmount> {
  final amountController = TextEditingController();
  bool enabled = false;

  @override
  void initState() {
    super.initState();
    amountController.addListener(
      () {
        //TODO add input handling method to enable buttpn
        toggleButton(true);
      },
    );
  }

  void toggleButton(bool toggleMode) {
    setState(() {
      enabled = toggleMode;
    });
  }

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
      onTap: enabled
          ? () {
              String amount = amountController.text;

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TransferChoose(amount: amount),
                ),
              );
            }
          : null,
      child: Container(
        height: 40,
        width: double.maxFinite,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: enabled ? Colors.green : Colors.green.withOpacity(0.3),
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
          const Text(
            "How much to Transfer out?",
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 32),
          inputTotal,
          const SizedBox(height: 32),
          nextButton,
        ],
      ),
    );
  }
}
