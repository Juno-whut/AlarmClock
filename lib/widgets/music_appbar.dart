import 'package:alarm_clock/constants/styles.dart';
import 'package:flutter/material.dart';

class MusicAppbar extends StatelessWidget {
  const MusicAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      margin: EdgeInsets.fromLTRB(0, 50, 0, 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Music Page", style: appBarStyle),
          IconButton(
            onPressed: () {}, 
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
