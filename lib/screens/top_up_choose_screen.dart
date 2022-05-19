import 'package:flutter/material.dart';
import 'package:wallet_rs/screens/top_up_final_amount_screen.dart';

class TopUpChoose extends StatelessWidget {
  const TopUpChoose({Key? key}) : super(key: key);

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
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TopUpAmount(topUpIconChoice: iconCard)),
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [buttonCard],
      ),
    );
  }
}
