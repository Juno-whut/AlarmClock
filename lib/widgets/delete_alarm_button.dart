import 'package:alarm_clock/constants/alarm_class.dart';
import 'package:alarm_clock/services/alarm_service.dart';
import 'package:flutter/material.dart';

class DeleteAlarm extends StatefulWidget {
  const DeleteAlarm({super.key, required this.i, required this.alarmList});
  final int i;
  final List<AlarmList> alarmList;

  @override
  State<DeleteAlarm> createState() => _DeleteAlarmState();
}

class _DeleteAlarmState extends State<DeleteAlarm> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        deleteAlarm(widget.i);
        setState((){
          widget.alarmList.removeAt(widget.i);
        });
      }, 
      icon: const Icon(
        Icons.delete, 
        color: Colors.white, size: 24
      ),
    );
  }
}