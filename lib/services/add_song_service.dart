import 'package:file_picker/file_picker.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart' as p;

Logger logger = Logger();

// Allows user to pick mp3 file from their device
Future<void> pickMp3File() async {
  final result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['mp3'],
  );

  if (result != null && result.files.single.path != null) {
    final filePath = result.files.single.path!;
    await storeMp3File(filePath);
  }
}

// Stores the mp3 file in the app's document directory
Future<void> storeMp3File(String filePath) async {
  final appDocDir = await getApplicationSupportDirectory(); // Get the app's document directory, if it doesnt exist it creates it and returns the path
  final songDir = Directory(p.join(appDocDir.path, 'songs')); 

  if (!await songDir.exists()) {
    await songDir.create(recursive: true);
  }

  final fileName = p.basename(filePath); 
  final destinationPath = p.join(songDir.path, fileName);
  logger.d(destinationPath);

  final sourceFile = File(filePath);
  await sourceFile.copy(destinationPath);
}