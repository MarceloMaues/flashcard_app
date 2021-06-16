import 'package:flashcard_app/Controller.dart';
import 'package:flashcard_app/FrontEnd/HomeView/Containers/DecksAvailable.dart';
import 'package:flashcard_app/FrontEnd/HomeView/Containers/BottomBar.dart';
import 'package:flashcard_app/FrontEnd/CreateDeckView/CreateDeckView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';



class HomeView extends StatelessWidget{
  HomeView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title:RichText(
                text:TextSpan(children:[
                  TextSpan(
                      text:'Flash',
                      style:TextStyle(
                        color: Color(0xff8FDC97),
                        fontSize: 30,
                      )
                  ),
                  TextSpan(
                      text:'Cards',
                      style:TextStyle(
                        color: Color(0xff57C4E5),
                        fontSize: 30,
                      )
                  )
                ]
                )
            )
        ),
        body: Consumer<Controller>(
            builder: (context, controller ,child){
              return DecksAvailable(context: context, entries: []);
            }
        ),
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
        bottomNavigationBar: BottomBar(key: key)
    );
  }
}
