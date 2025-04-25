import 'dart:convert';

import 'package:alarm_clock/constants/song_class.dart';
import 'package:file_picker/file_picker.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart' as p;
// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';

Logger logger = Logger();

// Allows user to pick mp3 file from their device
Future<SongLibrary?> importSong() async {
  final result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['mp3'],
  );

  if (result == null || result.files.single.path == null) return null;

  final filePath = result.files.single.path!;
  final fileName = p.basename(filePath);

  final appDocDir = await getApplicationSupportDirectory();
  final songDir = Directory(p.join(appDocDir.path, 'songs')); 

  if (!await songDir.exists()) {
    await songDir.create(recursive: true);
  }

  final destinationPath = p.join(songDir.path, fileName);
  await File(filePath).copy(destinationPath);

  logger.d('File copied to $destinationPath');

  
  try {
    final metadata = await MetadataRetriever.fromFile(File(destinationPath));
    final duration = metadata.trackDuration;

    if (duration == null) {
      logger.e('Could not retrieve duration');
      return null;
    }

    final totalSeconds = (duration / 1000).floor();
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    final formattedDuration = '$minutes:${seconds.toString().padLeft(2, '0')}';

    final songName = p.basenameWithoutExtension(filePath);
    
    final song = SongLibrary(
      length: formattedDuration,
      name: songName,
      path: destinationPath
    );

    logger.d('Song: $song');

    final existingList = await readSongJsonList();
    existingList.add(song.toJson());
    await writeSongJsonList(existingList);

    return song;
  } catch (e, stacktrace) {
    logger.e('Audio failed to load: $e');
    logger.e('Stack: $stacktrace');
    return null;
  } 
}


Future<bool> deleteMp3File(String filePath, int index) async {
  final jsonList = await readSongJsonList();
  jsonList.removeAt(index);
  await writeSongJsonList(jsonList);
  final file = File(filePath);
  if (await file.exists()) {
    await file.delete();
    return true;
  } else {
    return false;
  }
}


Future<File> getSongListFile() async {
  final dir = await getApplicationSupportDirectory();
  final file = File('${dir.path}/songs/songs.json');

  if (!(await file.exists())) {
    await file.create(recursive: true);
    await file.writeAsString('[]'); // initialize empty list
  }

  return file;
}

Future<List<dynamic>> readSongJsonList() async {
  final file = await getSongListFile();
  final content = await file.readAsString();
  return jsonDecode(content);
}

Future<void> writeSongJsonList(List<dynamic> jsonList) async {
  final file = await getSongListFile();
  await file.writeAsString(jsonEncode(jsonList));
}

Future<List<SongLibrary>> loadSongs() async {
  final jsonList = await readSongJsonList();
  return jsonList.map((e) => SongLibrary.fromJson(e)).toList();
}