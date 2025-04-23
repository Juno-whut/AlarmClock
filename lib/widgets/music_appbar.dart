import 'package:alarm_clock/constants/styles.dart';
import 'package:alarm_clock/pages/alarm_page.dart';
import 'package:flutter/material.dart';

class MusicAppbar extends StatelessWidget {
  const MusicAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.all(5),
      decoration: headerDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Music Page", style: appBarStyle),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AlarmPage()));
            }, 
            icon: const Icon(
              Icons.alarm_outlined, 
              color: Colors.white, size: 42
            ),
          ),
        ],
      ),
    );
  }
}
