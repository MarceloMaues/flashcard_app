import 'package:flashcard_app/FrontEnd/EditDeckView/Containers/MiniFlashCard.dart';
import 'package:flutter/material.dart';

import 'Containers/BottomEditBar.dart';

class DeckEdit extends StatelessWidget {
  DeckEdit({Key? key}) : super (key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(87, 196, 229, 1),
          actions: [
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.white,
            onPressed: (){
              Navigator.of(context).pushNamed('/EditDeckView');
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
          onPressed: (){

            Navigator.of(context).pushNamed('/CreateDeckView');
          },
          tooltip: 'New Deck',
          child: Icon(Icons.add),
          backgroundColor: Color(0xff8FDC97),
          elevation: 10.0,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomEditBar(key: key)
    );
  }
}

class CardCreation extends StatelessWidget {





  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        Expanded(
          child:GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: 10 ,
            itemBuilder: (BuildContext context,int index) {
              return MiniFlashCard();
             },
             ) 
        )

      ]
    );
               
  }
}

