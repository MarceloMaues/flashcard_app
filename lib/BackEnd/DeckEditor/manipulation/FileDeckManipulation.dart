import 'dart:io';
import 'dart:convert';
import '../Model/Decks.dart';

class FileDeckManipulation {
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

  //ler arquivo json
  Future<String> readStringFile(String nameFile) async {
    var file = File('File/' + nameFile + '.json');
    String contents = '';
    try {
      if (await file.exists()) {
        // ler o arquivo
        contents = await file.readAsString();
      }

      return contents;
    } catch (e) {
      return contents;
    }
  }

  //le o arquivo deck e retorna uma lista de strings
  Future<List<String>> readListFile(String nameFile) async {
    var file = File('File/' + nameFile + '.json');
    String contents;
    List<String> deck = [];
    try {
      if (await file.exists()) {
        // ler o arquivo
        contents = await file.readAsString();
        var dataDeck = jsonDecode(contents);
        if (dataDeck != null) {
          deck = List.from(dataDeck);
        }
      }
      return (deck);
    } catch (e) {
      return deck;
    }
  }

  //reescrever arquivo json
  Future<File> WriteFile(String nameDeck, String write) async {
    var file = File('File/' + nameDeck + '.json');

    Map<String, dynamic> userMap = jsonDecode(write);
    Decks dataName = Decks.fromJson(userMap);
    String json = jsonEncode(dataName);

    // Write the file
    return file.writeAsString('$json');
  }
}
