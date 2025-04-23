import 'package:alarm_clock/widgets/music_appbar.dart';
import 'package:flutter/material.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({super.key});

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PreferredSize(
          preferredSize: const Size.fromHeight(75.0),
          child: AppBar(
            title: Padding(
              padding: const EdgeInsets.all(0.0),
              child: MusicAppbar(),
            ),
          ),
        ),
      ),
      body: Container(),
    );
  }
}