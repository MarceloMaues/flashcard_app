import 'package:flutter/material.dart';

class DeckEdit extends StatelessWidget {
  DeckEdit({Key key}) : super (key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(87, 196, 229, 1),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_sharp),
            color: Colors.white,
            onPressed: () => {Navigator.of(context).pop(),
            Navigator.of(context).pop()},
          ),
      ),
      body: CardCreation(),
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
              return Container(
                height: 250,
                width: 150,
                child: Padding(
                  padding:EdgeInsets.all(200.0),
                      child: Card(
                      color: Color.fromRGBO(128, 128, 128, 1),
                )
                )
              );

             },
             ) 
        )

      ]
    );
               
  }
}

