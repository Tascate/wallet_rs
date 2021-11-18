import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' as intl;
import 'transaction.dart';
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

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color themeColor = const Color(0xff4AB94A);

  int currentBalance = 3488915;

  void updateBalance(int newBalance) {
    setState(() {
      currentBalance = newBalance;
    });
  }

  static const TextStyle balanceStyle =
      TextStyle(fontSize: 40, color: Colors.white);

  late Widget balanceText =
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    const Text(
      "Balance",
      style: balanceStyle,
    ),
    Text(
      "\$" + intl.NumberFormat.decimalPattern().format(currentBalance),
      style: balanceStyle,
      textAlign: TextAlign.center,
    ),
  ]);

  late Widget buttonSection = Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildButtonColumn(themeColor, Icons.near_me_outlined, 'Pay'),
      _buildButtonColumn(themeColor, Icons.money, 'Top-up'),
      _buildButtonColumn(themeColor, Icons.transform_outlined, 'Transfer'),
    ],
  );

  late Widget activitySection = ListView(children: [
    _buildActivityRow(true, "Top-up Recharge", DateTime.now(), 97),
    _buildActivityRow(
        false, "Flowers-a-Plenty", DateTime.utc(2020, 11, 9), 200),
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 0,
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: themeColor),
        ),
        body: ListView(children: [
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Align(alignment: Alignment.center, child: balanceText),
            height: 192,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32)),
              color: themeColor,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
            padding: EdgeInsets.symmetric(vertical: 4),
            child: buttonSection,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22), color: Colors.white),
          ),
          Container(
            width: 300,
            height: 320,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
            padding: EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22), color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                  padding: EdgeInsets.only(top: 8),
                  child: const Text(
                    "Recent Activity",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                    child: _buildActivityRow(
                        false, "Top-up Recharge", DateTime.now(), 23)),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                  child: _buildActivityRow(
                      true, "Flowers-a-Plenty", DateTime.utc(2020, 11, 9), 96),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                  child: _buildActivityRow(
                      false, "Transfer", DateTime.utc(2020, 12, 25), 200.54),
                ),
                Center(
                  child: Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Text(
                        "Show all",
                        style: TextStyle(color: Colors.blue),
                        textAlign: TextAlign.center,
                      )),
                )
              ],
            ),
          ),
        ]));
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 75,
            width: 88,
            margin: const EdgeInsets.only(top: 8),
            child: ListView(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Icon(
                      icon,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                  decoration:
                      BoxDecoration(color: color, shape: BoxShape.circle),
                ),
                Center(
                  child: Text(
                    label,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                )
              ],
            ))
      ],
    );
  }

  Row _buildActivityRow(
      bool spending, String title, DateTime timestamp, double expense) {
    Color arrowColor;
    IconData arrowIcon;
    Text expenseText;
    if (spending) {
      arrowColor = const Color(0xFFE72311);
      arrowIcon = Icons.arrow_circle_down_rounded;
      expenseText = Text(
        '-\$' + intl.NumberFormat.decimalPattern().format(expense),
        style: TextStyle(fontSize: 16, color: arrowColor),
      );
    } else {
      arrowColor = const Color(0xFF34CE4C);
      arrowIcon = Icons.arrow_circle_up_rounded;
      expenseText = Text(
        '\$' + intl.NumberFormat.decimalPattern().format(expense),
        style: TextStyle(fontSize: 16, color: arrowColor),
      );
    }

    Row newRow = Row(
      children: [
        Container(
          height: 64,
          width: 64,
          child: Center(
            child: Icon(
              arrowIcon,
              size: 48,
              color: Colors.white,
            ),
          ),
          decoration: BoxDecoration(
              color: arrowColor, borderRadius: BorderRadius.circular(16)),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title
              Container(
                padding: const EdgeInsets.only(left: 8, bottom: 8),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              //Date
              Container(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  intl.DateFormat('MM/dd/yyyy').format(timestamp),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[500],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(margin: const EdgeInsets.only(right: 8), child: expenseText)
      ],
    );

    return newRow;
  }
}
