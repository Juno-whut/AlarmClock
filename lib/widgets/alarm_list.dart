import 'package:alarm_clock/constants/fake_alarm_list.dart';
import 'package:alarm_clock/constants/styles.dart';
import 'package:flutter/material.dart';

class AlarmListWidget extends StatefulWidget {
  const AlarmListWidget({super.key});

  @override
  State<AlarmListWidget> createState() => _AlarmListWidgetState();
}

class _AlarmListWidgetState extends State<AlarmListWidget> {
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
          for (int i = 0; i < alarms.length; i++) 
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
                      if (alarms[i].title != null) Text(alarms[i].title!, style: bodyStyle,),
                      const SizedBox(width: 10,),
                      Text(alarms[i].time, style: timeStyle),
                      const SizedBox(width: 5,),
                      Text(alarms[i].ampm, style: timeStyle),
                      const SizedBox(width: 15,),
                      Text(alarms[i].song, style: bodyStyle,),
                      const SizedBox(width: 15,),
                      // figure out how to use switch
                      Switch(
                        value: alarms[i].isOn,
                        onChanged: (bool value) {
                          setState(() {
                            alarms[i].isOn = value;
                          });
                        },
                      ),
                      const SizedBox(width: 15,),
                      IconButton(
                        onPressed: () {}, 
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