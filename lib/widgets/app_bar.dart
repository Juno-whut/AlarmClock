import 'package:alarm_clock/widgets/alarm_clock_appbar.dart';
import 'package:alarm_clock/widgets/music_appbar.dart';
import 'package:flutter/material.dart';


// appbar for alarm Page
AppBar alarmAppBar = AppBar(
  title: PreferredSize(
    preferredSize: const Size.fromHeight(75.0),
    child: AppBar(
      title: Padding(
        padding: const EdgeInsets.all(10.0),
        child: AlarmClockAppbar(),
      ),
    ),
  ),
);


// appBar for music Page
AppBar musicPageAppBar = AppBar(
  title: PreferredSize(
    preferredSize: const Size.fromHeight(60.0),
    child: AppBar(
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        child: MusicAppbar()
      ),
    ),
  ),
);