import 'package:alarm_clock/constants/fake_alarm_list.dart';
import 'package:alarm_clock/constants/styles.dart';
import 'package:alarm_clock/widgets/alarm_list.dart';
import 'package:alarm_clock/widgets/app_barr.dart';
import 'package:flutter/material.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: alarmClockAppBar,

      body: SingleChildScrollView(
        child: Column(
          children: [
            AlarmListWidget(),
          ],
        ),
        

      ),
    );
  }
}