import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart'as p;
import 'package:flashcard_app/BackEnd/IO/CardFile.dart';
import 'package:flashcard_app/BackEnd/IO/DeckFile.dart';
import 'package:flashcard_app/BackEnd/DataStructures/Deck.dart';
import 'package:flashcard_app/BackEnd/DataStructures/FlashCard.dart';

class DeckFilesManipulation {
  
  Future<File> localFile(String fileName) async{
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    final f = fileName+'.json';
    final completepath = p.join(path, f);
    File newfile = new File(completepath);
    return newfile;
  }
  
  Future<int> saveFileString(String nameFile, String text) async {
    try {
      File file = await localFile(nameFile);
      // Write the file
      file.writeAsString(text);
      return 1;
    } catch (e) {
      return 0;
    }
  }

  //escreve no arquivo as informacoes do deck no formato json
  Future<int> saveFileDeck(String nameFile, Deck deck) async {
    File file = await localFile(nameFile);
    String infoJson;
    try {
      infoJson = '{ "name": ' +
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
      //escreve as informacao do deck no formato json
      await file.writeAsString(infoJson);
      return 1;
    } catch (e) {
      return 0;
    }
  }

  //le o arquivo e retorna uma String com o conteudo do json
  Future<String> readFileString(String nameFile) async {
    File file = await localFile(nameFile);
    String info = '';
    try {
      // Read the file
      info = await file.readAsString();

      return info;
    } catch (e) {
      return info;
    }
  }

  //le o arquivo
  Future<String> readFileDeck(String nameFile) async {
    File file = await localFile(nameFile);
    var dataName;
    String jsonString = '';
    Deck deck;
    try {
      // Read the file
      jsonString = await file.readAsString();
      dataName = await jsonDecode(jsonString);

      deck = new Deck(DeckFile.fromJson(dataName).name);
      for (int i = 0; i < DeckFile.fromJson(dataName).numCards; i++) {
        deck.addFlashCardString(DeckFile.fromJson(dataName).cards[i].front,
            DeckFile.fromJson(dataName).cards[i].back);
      }
      return jsonString;
    } catch (e) {
      return jsonString;
    }
  }
}