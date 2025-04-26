import 'package:alarm_clock/constants/alarm_class.dart';
import 'package:alarm_clock/constants/styles.dart';
import 'package:alarm_clock/services/alarm_service.dart';
import 'package:flutter/material.dart';

class AlarmListWidget extends StatefulWidget {
  const AlarmListWidget({super.key});

  @override
  State<AlarmListWidget> createState() => _AlarmListWidgetState(); 
}

class _AlarmListWidgetState extends State<AlarmListWidget> {
  List<AlarmList> alarmList = [];
  @override
  void initState(){
    super.initState();
    readAlarmJsonList().then((alarms) {
      setState((){
        alarmList = alarms;
      });
    });
  }

  void refreshPage() {
  setState(() {});
}

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
                      Switch(
                        value: alarmList[i].isOn,
                        onChanged: (bool value) async {
                          setState(() {
                            alarmList[i].isOn = value;
                          });
                          await updateAlarmInJson(alarmList[i]);
                          refreshPage();
                        },
                      ),
                      const SizedBox(width: 15,),
                      IconButton(
                        onPressed: () {
                          deleteAlarm(i);
                          setState((){
                            alarmList.removeAt(i);
                            refreshPage();
                          });
                        }, 
                        icon: const Icon(
                          Icons.delete, 
                          color: Colors.white, size: 24
                        ),
                      ),
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