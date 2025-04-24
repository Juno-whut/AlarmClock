import 'package:alarm_clock/widgets/add_song_button.dart';
import 'package:alarm_clock/widgets/music_appbar.dart';
import 'package:alarm_clock/widgets/song_list.dart';
import 'package:flutter/material.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({super.key});

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: Padding(
              padding: const EdgeInsets.all(0.0),
              child: MusicAppbar(),
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // music list
            SongList(),
            // add music button
            AddSongButton()
          ],
        ),
      ),
    );
  }
}