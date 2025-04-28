import 'package:alarm_clock/constants/alarm_class.dart';
import 'package:alarm_clock/services/alarm_service.dart';
import 'package:flutter/material.dart';

class AlarmSwitch extends StatefulWidget {
  const AlarmSwitch({super.key, required this.alarmList, required this.i});

  final List<AlarmList> alarmList;
  final int i;
  @override
  State<AlarmSwitch> createState() => _AlarmSwitchState();
}

class _AlarmSwitchState extends State<AlarmSwitch> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: widget.alarmList[widget.i].isOn,
      onChanged: (bool value) async {
        setState(() {
          widget.alarmList[widget.i].isOn = value;
        });
        await updateAlarmInJson(widget.alarmList[widget.i]);
      },
    );
  }
}