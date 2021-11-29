import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dashboard.dart';

void main() {
  runApp(const MyApp());
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
      home: const Dashboard(),
    );
  }
}
