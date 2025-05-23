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
  
  if (contents.trim().isEmpty) {
    return [];
  }

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

// update alarm
Future<void> updateAlarmInJson(AlarmList updatedAlarm) async {
  final alarms = await readAlarmJsonList();
  final index = alarms.indexWhere((alarm) => alarm.time == updatedAlarm.time && alarm.title == updatedAlarm.title);

  if (index != -1) {
    alarms[index] = updatedAlarm;
    final updatedJsonList = alarms.map((alarm) => alarm.toJson()).toList();
    await writeAlarmJsonList(updatedJsonList);
  }
}