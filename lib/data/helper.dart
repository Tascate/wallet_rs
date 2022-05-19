import 'dart:convert';
import 'package:wallet_rs/data/actvitiy.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<void> buildActivityList(List<Activity> activityList) async {
  //incase activityList is built already
  if (activityList.isNotEmpty) {
    return;
  }

  //read in data
  final data = await readActivity();
  if (data.isEmpty) {
    return;
  }

  //decode into json list
  var jsonActivity = json.decode(data) as List;

  //convert the json list into Activity
  //then insert into the activityList
  activityList =
      jsonActivity.map((activity) => Activity.fromJson(activity)).toList();
}

//Returns Activity as JSON list
Future<String> readActivity() async {
  try {
    final path = await getApplicationDocumentsDirectory();
    final file = await File('$path/activity.json').create(recursive: true);

    return file.readAsString();
  } catch (e) {
    return '';
  }
}

//write out ActivityList to file
Future<File> writeActivity(List<Activity> activityList) async {
  String jsonData = jsonEncode(activityList);
  final path = await getApplicationDocumentsDirectory();
  final file = await File('$path/activity.json').create(recursive: true);

  return file.writeAsString(jsonData);
}
