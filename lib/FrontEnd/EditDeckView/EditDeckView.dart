import 'package:flashcard_app/FrontEnd/EditDeckView/Containers/BottomEditBarCard.dart';
import 'package:flashcard_app/FrontEnd/EditDeckView/Containers/MiniFlashCard.dart';
import 'package:flutter/material.dart';

import 'Containers/BottomEditBar.dart';

class DeckEdit extends StatelessWidget {
  DeckEdit({Key? key}) : super(key: key);
  String joao="joaoooooooooooooooooooooooooooooooooooooooo";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(87, 196, 229, 1),
          title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: joao,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),),
          actions: [
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pushNamed('/CreateDeckView');
              },
            ),
          ],
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_sharp),
            color: Colors.white,
            onPressed: () => {Navigator.of(context).pop()},
          ),
        ),
        body: CardCreation(),
        floatingActionButton: FloatingActionButton(
          onPressed: () { 
            Navigator.of(context).pushNamed('CardFrontView');
          },
          tooltip: 'New Card',
          child: Icon(Icons.add),
          backgroundColor: Color(0xff8FDC97),
          elevation: 10.0,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomEditBarCard(key: key));
  }
}

class CardCreation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return MiniFlashCard();
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
