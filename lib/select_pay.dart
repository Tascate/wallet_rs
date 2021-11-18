import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class selectPay extends StatelessWidget {
  const selectPay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Search'),
          ),
          Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [Placeholder(), Text("Name")],
                  ),
                  Column(
                    children: [Placeholder(), Text("Name")],
                  ),
                  Column(
                    children: [Placeholder(), Text("Name")],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
