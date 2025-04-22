import 'package:alarm_clock/constants/styles.dart';
import 'package:flutter/material.dart';


// appbar for alarm Page
AppBar alarmClockAppBar = AppBar(
  title: Text("Alarm Page", style: appBarStyle),
  actions: [
    IconButton(
      onPressed: () {}, 
      icon: const Icon(
        Icons.music_video_outlined, 
        color: Colors.white, size: 42
      ),
    ),
  ],
);


// appBar for music Page
AppBar musicPageAppBar = AppBar(
  title: Text("Music Page", style: appBarStyle),
  actions: [
    IconButton(
      onPressed: () {}, 
      icon: const Icon(
        Icons.alarm_outlined, 
        color:Colors.white, size: 42
      ),
    ),
  ],
);