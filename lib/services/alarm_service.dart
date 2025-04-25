import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';
import 'package:alarm_clock/constants/alarm_class.dart';


Logger logger = Logger();


// Get alarms list form json file
Future<List<AlarmList>> readAlarmJsonList() async {
  final dir = await getApplicationSupportDirectory();
  final file = File('${dir.path}/alarms.json');

  if (!await file.exists()) {
    await file.writeAsString(jsonEncode([]));
  }

  final contents = await file.readAsString();
  final List<dynamic> data = jsonDecode(contents);

  return data.map((json) => AlarmList.fromJson(json)).toList();
}

// Write alarms list to json file
Future<void> writeAlarmJsonList(List<Map<String, dynamic>> list) async {
  final dir = await getApplicationSupportDirectory();
  final file = File('${dir.path}/alarms.json');
  await file.writeAsString(jsonEncode(list));
}


// Delete Alarm
Future<void> deleteAlarm(alarmIndex) async {
  final alarmList = await readAlarmJsonList();
  alarmList.removeAt(alarmIndex);
  await writeAlarmJsonList(alarmList.map((a) => a.toJson()).toList());

}