import 'package:flutter/material.dart';

class EditCardView extends StatelessWidget{
  EditCardView({Key? key}) : super(key: key);
  //String oldFront, oldBack;
  TextEditingController cardNameFront = TextEditingController(text:"I am smart");
  TextEditingController cardNameBack = TextEditingController(text:"jkbbiukbk");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(87, 196, 229, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(87, 196, 229, 1),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            color: Colors.white,
            onPressed: () {

            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp),
          color: Colors.white,
          onPressed: () => {Navigator.of(context).pop()},
        ),
      ),
      body:
      Center(
        child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Front face:",style: TextStyle(color: Color(0xff8FDC97),fontSize: 20)
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child:ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 150),
                      child: TextField(
                        controller: cardNameFront,
                        maxLength: 100,

                        onSubmitted: (String teste) {
                          print(teste);
                        },
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )

                  ,SizedBox(
                    height: 50,
                  ),
                  Text("Back face:",style: TextStyle(color: Color(0xff8FDC97),fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child:ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 150),
                      child: TextField(
                        controller: cardNameBack,
                        maxLength: 100,
                        onSubmitted: (String teste) {
                          print(teste);
                        },
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ]
            )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // deletar o card
        },
        tooltip: 'Delete Card',
        child: Icon(Icons.delete),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}