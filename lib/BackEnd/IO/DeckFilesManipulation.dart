import 'dart:io';
import 'dart:convert';
import 'package:flashcard_app/BackEnd/IO/DeckFilesStructures.dart';

class DeckFilesManipulation {
  //cria arquivo json
  Future<int> createJsonFile(String nameFile) async {
    var file = File('File/' + nameFile + '.json');
    try {
      //verifica ja existe um arquivo com o mesmo nome
      if (await file.exists() == false) {
        //cria um arquivo json vazio
        await File('File/' + nameFile + '.json').writeAsString("");
        return 1;
      } else {
        return 0;
      }
    } catch (e) {
      //caso de erro retorna 0
      return 0;
    }
  }

//delete o arquivo json
  Future<int> deleteJsonFile(String nameFile) async {
    var file = File('File/' + nameFile + '.json');
    try {
      //verifica se existe o arquivo
      if (await file.exists()) {
        //deleta o arquivo
        await file.delete();
        //caso consiga deletar retorna 1
        return 1;
      } else {
        //caso nao exista o arquivo retorna 0
        return 0;
      }
    } catch (e) {
      //caso de erro retorna 0
      return 0;
    }
  }

//reescrever no arquivo
  Future<File> WriteFileDeck(String nameDeck, String write) async {
    var file = File('File/' + nameDeck + '.json');

    Map<String, dynamic> userMap = jsonDecode(write);
    Decks dataName = Decks.fromJson(userMap);
    String json = jsonEncode(dataName);

    // Write the file
    return file.writeAsString('$json');
  }

//le o arquivo NameDecks e retorna uma list
  Future<List<String>> readListDeck(String nameDeck) async {
    var file = File('File/' + nameDeck + '.json');
    String contents;
    List<String> names = ['null'];
    try {
      // ler o arquivo
      contents = await file.readAsString();
      var dataName = jsonDecode(contents)['info'];
      if (dataName != null) {
        names = List.from(dataName);
      }

      return (names);
    } catch (e) {
      return names;
    }
  }

//le o arquivo NameDecks e retorna uma String no formato json
  Future<String> readStringDeck(String nameDeck) async {
    var file = File('File/' + nameDeck + '.json');
    String contents = '';
    try {
      // ler o arquivo
      contents = await file.readAsString();

      return (contents);
    } catch (e) {
      return contents;
    }
  }

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
