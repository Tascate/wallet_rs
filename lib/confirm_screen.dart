import 'package:flutter/material.dart';
import 'package:wallet_rs/transaction.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen(
      {Key? key, required this.confirmMessage, required this.success})
      : super(key: key);

  final String confirmMessage;
  final bool success;

  @override
  Widget build(BuildContext context) {
    var backgroundColor = success ? Colors.green : Colors.red;
    var confirmIcon = success ? Icons.check_outlined : Icons.close_outlined;
    var buttonText = success ? "Complete" : "Okay";
    var whiteFocusStyle = TextStyle(
      color: Colors.white,
      fontSize: 32,
    );

    var confirmButton = GestureDetector(
      onTap: () {
        //go back to dashboard
        Navigator.of(context).popUntil((route) => route.isFirst);
      },
      child: Container(
        height: 40,
        width: double.maxFinite,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(22)),
        ),
        child: Text(
          buttonText,
          style: TextStyle(color: backgroundColor, fontSize: 22),
        ),
      ),
    );

    return Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 80,
              child: Center(
                child: Icon(
                  confirmIcon,
                  size: 160,
                  color: backgroundColor,
                ),
              ),
            ),
            SizedBox(height: 32),
            Text(
              confirmMessage,
              textAlign: TextAlign.center,
              style: whiteFocusStyle,
            ),
            SizedBox(height: 32),
            confirmButton,
          ],
        ));
  }
}
