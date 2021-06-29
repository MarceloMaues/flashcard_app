import 'package:flutter/material.dart';
import 'package:flashcard_app/FrontEnd/CreateDeckView/Containers/DeckNameBox.dart';
import 'package:dartdoc/dartdoc.dart';

///Cria a tela de dar nome aos decks
class CreateDeckView extends StatelessWidget {
  CreateDeckView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff57C4E5),
        appBar: AppBar(
          backgroundColor: Color(0xff57C4E5),
          leading: IconButton(
            color: Colors.white,
            icon: const Icon(Icons.arrow_back_ios_new_sharp),
            onPressed: () {
              Navigator.of(context).pop(context);
            }
          ),
        ),
        body: DeckNameBox()
    );
  }
}


