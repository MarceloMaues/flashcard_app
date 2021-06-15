import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flashcard_app/BackEnd/IO/CardTest.dart';
import 'package:flashcard_app/BackEnd/IO/DeckTest.dart';
import 'package:flashcard_app/BackEnd/DataStructures/Deck.dart';
import 'package:flashcard_app/BackEnd/DataStructures/FlashCard.dart';

class DeckFileMannipulation {


  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<int> readFile() async {
    try {
      final file = await _localFile;
      // Read the file
      final contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  Future<File> writeFile() async {
    final file = await _localFile;
    // Write the file
    return file.writeAsString('oi');
  }

  Future<List<String>>readDeckNames() async {
    List items = [];
    List<String> deckNames = [];
    final String response = await rootBundle.loadString('assets/config.json');
    final data = await json.decode(response);
    items = data["items"];
    for(int i =0;i<items.length;i++){
      deckNames.add(items[i]["name"]);
    }
    return deckNames;
  }

  void readDeck(String file) async{
      Deck deck;
      DeckTest deckJson = DeckTest.fromJson(jsonDecode(utf8.decode(file.codeUnits)));
      deck = Deck(deckJson.name);
      int max = deckJson.cards.length;
      for(int i =0; i< max;i++){
        CardTest cardJson = deckJson.cards[i];
        FlashCard card = FlashCard(cardJson.back, cardJson.front);
        deck.addFlashCard(card);
        print(deck.toString());
      }

  }


}

