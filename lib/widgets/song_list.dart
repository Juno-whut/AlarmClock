import 'package:alarm_clock/constants/song_class.dart';
import 'package:alarm_clock/constants/styles.dart';
import 'package:alarm_clock/services/music_service.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


class SongList extends StatefulWidget {
  const SongList({super.key});
  @override
  State<SongList> createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  List<SongLibrary> songList = [];
  AudioPlayer? _audioPlayer;
  int? _currentPlayingIndex;

  @override
  void initState() {
    super.initState();
    loadSongs().then((songs) {
      setState(() {
        songList = songs;
      });
    });
    _audioPlayer = AudioPlayer();
  } 

  @override
  void dispose() {
    _audioPlayer?.dispose();
    super.dispose();  
  }

  Future<void> _playSample(String path, int index) async {
    if (_currentPlayingIndex != null && _currentPlayingIndex != index) {
      await _audioPlayer!.stop();
    }

    _currentPlayingIndex = index;
    await _audioPlayer!.play(DeviceFileSource(path));
    
    Future.delayed(Duration(seconds:15), () async {
      await _audioPlayer!.stop();
      _currentPlayingIndex = null;  
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
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
                    onPressed: () {
                      _playSample(songList[i].path,  i);
                      
                    }, // using audioplayer packagae play first 15 seconds of songList[i].path
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
                    onPressed: () {
                      deleteMp3File(songList[i].path, i);
                      setState(() {
                        songList.removeAt(i);
                      });
                    },
                    icon: const Icon(
                      Icons.delete, 
                      color: Colors.white, size: 28
                    ),
                  ),
                  
                ],
              ),
            ),
        ],
        
      ),
    );
  }
}