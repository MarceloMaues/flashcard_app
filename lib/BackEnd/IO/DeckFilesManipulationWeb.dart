import 'dart:convert';
import 'dart:html';

import 'package:file_picker/file_picker.dart';
import 'package:flashcard_app/BackEnd/DataStructures/Deck.dart';
import 'DeckTest.dart';

class DeckFilesManipulationWeb {
  void download(
    List<int> bytes, {
    String downloadName = '',
  }) {
    // Encode our file in base64
    final _base64 = base64Encode(bytes);
    // Create the link with the file
    final anchor =
        AnchorElement(href: 'data:application/octet-stream;base64,$_base64')
          ..target = 'blank';
    // add the name
    if (downloadName != null) {
      anchor.download = downloadName;
    }
    // trigger download
    document.body?.append(anchor);
    anchor.click();
    anchor.remove();
    return;
  }

  void saveDeck(String name, String info) {
    Map<String, dynamic> deckMap = jsonDecode(name);
    DeckTest dataName = DeckTest.fromJson(deckMap);
    String infoJson = jsonEncode(dataName);
    String nameFile = name + '.json';

    download(infoJson.codeUnits, downloadName: nameFile);
  }

  Future<String> readFile() async {
    FilePickerResult result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['json']);
    String jsonString = '';
    if (result != null) {
      try {
        jsonString = new String.fromCharCodes(result.files.first.bytes);
      } catch (e) {}
    }
    return jsonString;
  }
}
