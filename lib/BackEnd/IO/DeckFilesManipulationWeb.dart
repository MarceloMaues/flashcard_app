import 'dart:convert';
import 'dart:html';
import 'package:file_picker/file_picker.dart';
import 'package:flashcard_app/BackEnd/DataStructures/Deck.dart';
import 'package:flashcard_app/BackEnd/DataStructures/FlashCard.dart';
import 'DeckFile.dart';
import 'CardFile.dart';

class DeckFilesManipulationWeb {
  void download(
    List<int> bytes, {
    String downloadName = '',
  }) {
    final _base64 = base64Encode(bytes);

    final anchor =
        AnchorElement(href: 'data:application/octet-stream;base64,$_base64')
          ..target = 'blank';

    if (downloadName != null) {
      anchor.download = downloadName;
    }

    document.body?.append(anchor);
    anchor.click();
    anchor.remove();
    return;
  }

  void saveFileString(String name, String info) {
    String nameFile = name + '.json';

    Map<String, dynamic> deckMap = jsonDecode(name);
    DeckFile dataName = DeckFile.fromJson(deckMap);
    String infoJson = jsonEncode(dataName);

    download(infoJson.codeUnits, downloadName: nameFile);
  }

  // pega a variavel deck, o formata para json e salva
  void saveFileDeck(String name, Deck deck) {
    String nameFile = name + '.json';
    String infoJson = '{ "name": ' +
        deck.getDeckName() +
        ',"numCards": ' +
        deck.getDeckSize().toString() +
        '"cards": [';
    for (int i = 0; i < deck.getDeckSize(); i++) {
      infoJson = infoJson +
          '{"front": ' +
          deck.getFlashCard(i).getFrontSide() +
          ', "back": ' +
          deck.getFlashCard(i).getBackSide() +
          '}';
      if (i != deck.getDeckSize() - 1) {
        infoJson = infoJson + ',';
      }
    }
    infoJson = infoJson + ']}';
    download(infoJson.codeUnits, downloadName: nameFile);
  }

  Future<String> readFileString() async {
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

  Future<Deck> readFileDeck() async {
    Deck deck;
    FlashCard cardTemp;
    var dataName;
    FilePickerResult result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['json']);
    String jsonString = '';
    if (result != null) {
      try {
        jsonString = new String.fromCharCodes(result.files.first.bytes);
        dataName = await jsonDecode(jsonString);

        deck = new Deck(DeckFile.fromJson(dataName).name);
        for (int i = 0; i < DeckFile.fromJson(dataName).numCards; i++) {
          deck.addFlashCardString(DeckFile.fromJson(dataName).cards[i].front,
              DeckFile.fromJson(dataName).cards[i].back);
        }
      } catch (e) {}
    }

    return deck;
  }
}
