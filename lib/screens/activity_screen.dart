import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart' as intl;
import '../data/actvitiy.dart';

class ActivityScreen extends StatelessWidget {
  ActivityScreen({Key? key}) : super(key: key);

  Activity act1 = Activity(2532.54, false, "Top-up", DateTime.now());
  Activity act2 = Activity(30.54, true, "To Sam", DateTime.now());

  @override
  Widget build(BuildContext context) {
    List activityList =
        Provider.of<ActivityList>(context, listen: true).transactions;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 52,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Activity",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        backgroundColor: const Color(0xff4AB94A),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(22),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: activityList.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildActivityRow(activityList[index]);
        },
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
