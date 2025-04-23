import 'package:alarm_clock/constants/fake_song_list.dart';
import 'package:alarm_clock/constants/styles.dart';
import 'package:flutter/material.dart';

class SongList extends StatelessWidget {
  const SongList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height:20),
        Text("Song List", style: headingStyle,),
        SizedBox(height: 20,),
        for (int i = 0; i < songList.length; i++) 
          Container(
            height: 65,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(15.0),
            decoration: headerDecoration,
            child: Row(
              children: [
                // Sample Button
                IconButton(
                  onPressed: () {}, // using audioplayer packagae play first 15 seconds of songList[i].path
                  icon: const Icon(
                    Icons.play_circle_outline_sharp, 
                    color: Colors.white, size: 28
                  ),
                ),
                const SizedBox(width: 10),
                // Name of the song
                Text(songList[i].name, style: bodyStyle,),
                const SizedBox(width: 30),
                // length of the song
                Text(songList[i].length, style: bodyStyle,),
                const SizedBox(width: 20),
                // Delete Button
                IconButton(
                  onPressed: () {}, 
                  icon: const Icon(
                    Icons.delete, 
                    color: Colors.white, size: 28
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}