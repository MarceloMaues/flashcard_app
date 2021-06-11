import 'dart:io';
import 'dart:convert';
import '../Model/NameDecks.dart';

class FileNameDeckManipulation {
  //le o arquivo NameDecks e retorna uma lista de strings
  Future<List<String>> readListNameDecks() async {
    var file = File('File/nameDecks.json');
    String contents;
    List<String> names = [];
    try {
      if (await file.exists()) {
        // ler o arquivo
        contents = await file.readAsString();
        var dataName = jsonDecode(contents)['nameDeck'];
        if (dataName != null) {
          names = List.from(dataName);
        }
      }
      return (names);
    } catch (e) {
      return names;
    }
  }

  //le o arquivo NameDecks e retorna uma String no formato json
  Future<String> readStringNameDecks() async {
    var file = File('File/nameDecks.json');
    String contents = '';
    try {
      if (await file.exists()) {
        contents = await file.readAsString();
      }
      return (contents);
    } catch (e) {
      //retorna a string vazio
      return contents;
    }
  }

  //escreve no arquivo
  //com o seguinte formato [ingles, portugues, espanhol]
  Future<bool> writeFileInNameDecks(String write) async {
    var file = File('File/nameDecks.json');
    try {
      if (await file.exists()) {
        // transforma a String no formado json
        Map<String, dynamic> userMap = jsonDecode(write);
        NameDecks dataName = NameDecks.fromJson(userMap);
        String json = jsonEncode(dataName);
        //escreve o que estiver no arquivo
        file.writeAsString('$json');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  //reescrevo o arquivo
  //com o seguinte formato [ingles, portugues, espanhol]
  Future<bool> overWriteFileInNameDecks(String write) async {
    var file = File('File/nameDecks.json');
    try {
      if (await file.exists()) {
        // transforma a String no formado json
        Map<String, dynamic> userMap = jsonDecode(write);
        NameDecks dataName = NameDecks.fromJson(userMap);
        String json = jsonEncode(dataName);
        //sobre escreve o que estiver no arquivo
        file.writeAsString('$json');
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
