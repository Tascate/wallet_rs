import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wallet_rs/pay_select_screen.dart';
import 'package:wallet_rs/top_up_choose_screen.dart';
import 'package:wallet_rs/actvitiy.dart';
import 'package:wallet_rs/transfer_amount_screen.dart';
import 'package:wallet_rs/user.dart';
import 'dashboard.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserData()),
        ChangeNotifierProvider(create: (context) => ActivityList())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallet App',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF1F1F6),
        textTheme: GoogleFonts.varelaRoundTextTheme(),
      ),
      initialRoute: '/db',
      routes: {
        '/db': (context) => Dashboard(),
        '/pay': (context) => SelectPay(),
        '/topup': (context) => TopUpChoose(),
        '/transfer': (context) => TransferAmount(),
      },
      home: Dashboard(),
    );
  }
}
