import 'dart:async';

import 'package:alarm_clock/constants/alarm_class.dart';
import 'package:alarm_clock/services/alarm_service.dart';
import 'package:alarm_clock/widgets/add_alarm_button.dart';
import 'package:alarm_clock/widgets/alarm_clock_appbar.dart';
import 'package:alarm_clock/widgets/alarm_list.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  AudioPlayer? audioPlayer;
  List<AlarmList>? alarmList = [];
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    readAlarmJsonList().then((alarms) {
      setState((){
        audioPlayer = AudioPlayer();
        alarmList = alarms;
        startAlarmWatcher(alarms);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer?.dispose();
  }

  Future<void> playAlarmSong(String path) async {
    try {
      await audioPlayer!.stop();
      await audioPlayer!.play(DeviceFileSource(path));
      await audioPlayer!.setReleaseMode(ReleaseMode.loop);
      // logger.d('Playing song from path: $path');
      setState(() => isPlaying = true);

    } catch (e) {
      logger.e('Failed to play alarm song: $e');
    }
  }

  Future<void> stopAlarmSong() async {
    try {
      await audioPlayer!.stop();  
      setState(() => isPlaying = false);
    } catch (e) {
      logger.e('Failed to stop alarm song: $e');
    }
  }

  // Alarm Watcher
  void startAlarmWatcher(List<AlarmList> alarms) {
    Timer.periodic(Duration(minutes: 1), (timer) async {
      final now = TimeOfDay.now();
      final hour = now.hourOfPeriod == 0 ? 12 : now.hourOfPeriod;
      final minute = now.minute.toString().padLeft(2, '0');
      final ampm = now.period == DayPeriod.am ? 'AM' : 'PM';
      final formattedNow = '$hour:${minute.toString().padLeft(2, '0')}';

      // logger.d('Checking alarms at $formattedNow $ampm');

    for (final alarm in alarms) {
      logger.d('Checking alarm: ${alarm.time} ${alarm.ampm}');
      if (alarm.isOn &&
          alarm.time == formattedNow &&
          alarm.ampm == ampm) {
        // logger.d('Triggering alarm: ${alarm.title}');
        await playAlarmSong(alarm.songPath);
        break;
        }
      }
    });
  }

  Future<void> loadAlarms() async {
    readAlarmJsonList().then((alarms) {
      setState(() {
        alarmList = alarms;
      });
    }); 
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
            AlarmListWidget(alarmList: alarmList!), 
            AddAlarmButton(onAlarmAdded: loadAlarms),
            SizedBox(height: 15),
            if (isPlaying)
              ElevatedButton(
                onPressed: stopAlarmSong,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: Text('Stop Alarm'),
              ),
          ],
        ),
      ),
    );
  }
}