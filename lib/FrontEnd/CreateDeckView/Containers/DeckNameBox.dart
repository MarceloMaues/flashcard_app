import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeckNameBox extends StatelessWidget {
  DeckNameBox({Key key}) : super(key: key);
  TextEditingController deckName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(

      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Color.fromRGBO(87, 196, 229, 1),
                width: 200,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Name the new deck:',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  SizedBox(height: 50),
                ],
              ),
            ]),
        Container(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 150),
            child: TextField(
              controller: deckName,
              maxLength: 30,
              decoration: InputDecoration(
                labelText: 'Deck name',
              ),
              onSubmitted: (String teste) {
                print(teste);
              },
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          margin: EdgeInsets.all(25.0),
          alignment: Alignment.center,
          width: 200,
          height: 200,

        ),
        Row(
          children: <Widget>[
            SizedBox(height: 100),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                String noSpace = deckName.text.trim();
                if(deckName.text.isNotEmpty && noSpace.isNotEmpty){
                  try {
                    //save deck + go to edit deck here
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.SUCCES,
                      animType: AnimType.BOTTOMSLIDE,
                      title: 'Congratulations!',
                      desc: 'You created a deck named '+noSpace,
                      btnOkOnPress: () { Navigator.of(context).pushNamed('/EditDeckView');},
                    )..show();

                  } catch (e) {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.ERROR,
                      animType: AnimType.BOTTOMSLIDE,
                      title: 'Ops......!:',
                      desc: 'A error ocurred: '+e.toString(),
                      btnOkOnPress: () {},
                    )..show();

                  }
                  print(noSpace);
                }else{
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.ERROR,
                    animType: AnimType.BOTTOMSLIDE,
                    title: 'Ops......!:',
                    desc: 'Deck name needs to be not empty!',
                    btnOkOnPress: () {},
                  )..show();
                }},
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(143, 220, 151, 1),
                elevation: 20.0,
                textStyle: TextStyle(
                  fontSize: 30,
                ),
              ),
              child: const Text(
                '  Done  ',
              ),
            ),
          ],
        ),
      ],
    );
  }



}