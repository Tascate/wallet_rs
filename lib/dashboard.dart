import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';
import 'package:wallet_rs/screens/activity_screen.dart';
import 'package:wallet_rs/screens/pay_select_screen.dart';
import 'package:wallet_rs/screens/top_up_choose_screen.dart';
import 'data/actvitiy.dart';
import 'data/user.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //TODO move these into a universal file that all files can use
  //Temporary variables
  Color themeColor = const Color(0xff4AB94A);
  Color lessThemeColor = const Color(0xff34A334);
  TextStyle focusStyle = const TextStyle(
      color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600);
  TextStyle mainStyle = const TextStyle(
      color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700);

  //placeholder variables to test transaction widget

  Activity transactionPlaceholder1 =
      Activity(2532.54, false, "Top-up", DateTime.now());
  Activity transactionPlaceholder2 =
      Activity(30.54, true, "To Sam", DateTime.now());

  @override
  Widget build(BuildContext context) {
    //TODO serialize and deserialize Transaction data
    //Testing Transaction Model default data
    //Provider.of<ActivityList>(context, listen: false).quickAdd(transactionPlaceholder1);
    //Provider.of<ActivityList>(context, listen: false).quickAdd(transactionPlaceholder2);
    List<Activity> list =
        Provider.of<ActivityList>(context, listen: true).transactions;

    Widget topBar = SizedBox(
      height: 36,
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16, top: 8),
            child: Icon(
              Icons.menu_rounded,
              size: 36,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 16, top: 8),
              child: Consumer<User>(
                builder: (context, userData, child) => Text(
                  userData.firstName,
                  style: focusStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );

    Widget balanceSection = SizedBox(
      height: 128,
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Balance",
            style: focusStyle,
          ),
          Consumer<User>(
            builder: (context, userData, child) => Text(
              '\$' +
                  intl.NumberFormat.decimalPattern().format(userData.balance),
              style: mainStyle,
            ),
          ),
        ],
      ),
    );

    Widget buttonSection = Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(
              lessThemeColor, Icons.near_me_outlined, 'Pay', '/pay'),
          _buildButtonColumn(
              lessThemeColor, Icons.payments_outlined, 'Top-up', '/topup'),
          _buildButtonColumn(lessThemeColor, Icons.transform_outlined,
              'Transfer', '/transfer'),
        ],
      ),
    );

    Widget topSection = Container(
      decoration: BoxDecoration(
        color: themeColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Column(
        children: [
          topBar,
          balanceSection,
          buttonSection,
        ],
      ),
    );

    _buildActivitySection() {
      List<Widget> hi = [];
      int i = 0;
      while (i < list.length && i < 5) {
        hi.add(_buildActivityRow(list[i]));
        i++;
      }
      return Column(
        children: hi,
      );
      ;
    }

    Widget activitySection = _buildActivitySection();

    //Widget activityList = ListView.builder(itemBuilder: null);

    Widget bottomSection = Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(32)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                bottom: 8.0, top: 16.0, left: 16, right: 16),
            child: Row(
              children: [
                Text(
                  "Recent Activity",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    child: Text(
                      "View all",
                      style: TextStyle(color: Colors.blueAccent, fontSize: 16),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ActivityScreen()));
                    },
                  ),
                ),
              ],
            ),
          ),
          activitySection
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 0,
        backgroundColor: themeColor,
      ),
      body: Column(
        children: [
          topSection,
          bottomSection,
        ],
      ),
    );
  }

  _buildButtonColumn(Color bgColor, IconData icon, String label, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(route);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(22)),
          color: bgColor,
        ),
        height: 88,
        width: 88,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 42,
              color: Colors.white,
            ),
            Text(label, style: focusStyle),
          ],
        ),
      ),
    );
  }

  _buildActivityRow(Activity data) {
    IconData splash = Icons.arrow_circle_down_rounded;
    Color? splashBGcolor = Colors.red;
    Color moneyTextColor = splashBGcolor;
    String prefix = "-\$";
    if (!data.isSpending) {
      splash = Icons.arrow_circle_up_rounded;
      splashBGcolor = Color(0xFF34CE4C);
      moneyTextColor = Colors.green;
      prefix = "+\$";
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: splashBGcolor),
            child: Icon(
              splash,
              color: Colors.white,
              size: 40,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    intl.DateFormat('MM/dd/yyyy').format(data.timestamp),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  )
                ],
              ),
            ),
          ),
          Text(
            prefix + intl.NumberFormat.decimalPattern().format(data.amount),
            style: TextStyle(fontSize: 16, color: moneyTextColor),
          ),
        ],
      ),
    );
  }
}
