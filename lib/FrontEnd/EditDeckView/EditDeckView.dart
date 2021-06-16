import 'package:flashcard_app/FrontEnd/EditDeckView/Containers/BottomEditBarCard.dart';
import 'package:flashcard_app/FrontEnd/EditDeckView/Containers/MiniFlashCard.dart';
import 'package:flashcard_app/FrontEnd/EditDeckView/Containers/ScreenArguments.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Controller.dart';

class DeckEdit extends StatelessWidget {
  DeckEdit({Key key}) : super (key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<Controller>(
        builder: (context, controller ,child){
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Color.fromRGBO(87, 196, 229, 1),
                title: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: controller.selectedName,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                ),
              ),
              body: CardCreation(),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/EditCardView',arguments: ScreenArguments("", ""));
                },
                tooltip: 'New Card',
                child: Icon(Icons.add),
                backgroundColor: Color(0xff8FDC97),
                elevation: 10.0,
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: BottomEditBarCard(key: key)
          );
        }
    );
  }
}


class CardCreation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Controller>(
        builder: (context, controller ,child){
          List<List<String>> faces = controller.getDeckFaces();
          return ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: controller.numCards,
            itemBuilder: (BuildContext context, int index) {
              return Consumer<Controller>(
                  builder: (context, controller ,child){
                    return MiniFlashCard(oldBack: faces[0][index],oldFront:faces[1][index]);
                  }
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(),
          );
        }
    );


  }
}

