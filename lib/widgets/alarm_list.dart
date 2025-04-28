import 'package:alarm_clock/constants/alarm_class.dart';
import 'package:alarm_clock/constants/styles.dart';
import 'package:alarm_clock/widgets/alarm_switch.dart';
import 'package:alarm_clock/widgets/delete_alarm_button.dart';
import 'package:flutter/material.dart';

class AlarmListWidget extends StatelessWidget {
  final List<AlarmList> alarmList;
  const AlarmListWidget({super.key, required this.alarmList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height:20),
          Text("Alarm List", style: headingStyle,),
          for (int i = 0; i < alarmList.length; i++) 
            Container(
              height: 75,
              decoration: headerDecoration,
              padding: const EdgeInsets.all(15.0),
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (alarmList[i].title != null) Text(alarmList[i].title!, style: bodyStyle,),
                      const SizedBox(width: 10,),
                      Text(alarmList[i].time, style: timeStyle),
                      const SizedBox(width: 5,),
                      Text(alarmList[i].ampm, style: timeStyle),
                      const SizedBox(width: 15,),
                      Text(alarmList[i].song, style: bodyStyle,),
                      const SizedBox(width: 15,),
                      // figure out how to use switch
                      AlarmSwitch(alarmList: alarmList, i: i),
                      const SizedBox(width: 15,),
                      DeleteAlarm(alarmList: alarmList, i: i,),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}