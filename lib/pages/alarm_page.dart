import 'package:alarm_clock/widgets/add_alarm_button.dart';
import 'package:alarm_clock/widgets/alarm_clock_appbar.dart';
import 'package:alarm_clock/widgets/alarm_list.dart';
import 'package:flutter/material.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PreferredSize(
          preferredSize: const Size.fromHeight(75.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: Padding(
              padding: const EdgeInsets.all(10.0),
              child: AlarmClockAppbar(),
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            AlarmListWidget(),
            AddAlarmButton(),
          ],
        ),
      ),
    );
  }
}