import 'package:alarm_clock/constants/styles.dart';
import 'package:flutter/material.dart';

class AlarmClockAppbar extends StatelessWidget {
  const AlarmClockAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(25, 50, 25, 50),
      decoration: headerDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Alarm Page", style: appBarStyle),
          IconButton(
            onPressed: () {}, 
            icon: const Icon(
              Icons.music_video_outlined, 
              color: Colors.white, size: 42
            ),
          ),
        ],
      ),
    );
  }
}