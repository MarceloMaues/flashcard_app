import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:provider/provider.dart';
import '../../Controller.dart';
import "Botaos.dart";

class GameView extends StatelessWidget {
  GameView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(87, 196, 229, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(87, 196, 229, 1),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            color: Colors.white,
            onPressed: () {
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
      body: Center(child: FlashcardFront()),
    );
  }
}

int counterIsCorrect = 0;
int counterIsWrong = 0;

class FlashcardFront extends StatelessWidget {
  @override
  Widget build(BuildContext screen) {
    return Consumer<Controller>(builder: (context, controller, child) {
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
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      controller.getSelectedDeckName(),
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(height: 50),
                  ],
                ),
              ]),
          FlipCard(
              direction: FlipDirection.HORIZONTAL,
              onFlipDone: (status) {
                print(status);
              },
              front: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      controller.getGameDeckCardFront(0),
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                    alignment: Alignment.center,
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(height: 118),
                    ],
                  ),
                ],
              ),
              back: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      controller.getGameDeckCardBack(0),
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                    alignment: Alignment.center,
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(height: 38),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CheckboxShower(),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(height: 38),
                    ],
                  ),
                ],
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Buttons(),
            ],
          ),
        ],
      );
    });
  }
}

class CheckboxShower extends StatelessWidget {
  @override
  Widget build(BuildContext checkbox) {
    return Consumer<Controller>(builder: (context, controller, child) {
      return Botaos(
        context: context,
        value: controller.acertou,
      );
    });
  }
}

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext button) {
    return Consumer<Controller>(builder: (context, controller, child) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xff8FDC97),
              ),
              child: Text("  Next Flashcard  "),
              onPressed: () {
                controller.removeCard(0);
                //condicional para verificar se pode ir para a tela de fim de jogo
                if (controller.endCheckGameLoop() == true) {
                  Navigator.of(button).pushNamed('/PointsView');
                }
              },
            ),
          ),
          SizedBox(width: 50),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xff8FDC97),
              ),
              child: Text("Random Flashcard"),
              onPressed: () {
                controller.removeCard(0);
                controller.randomCardGameDeck;

                //condicional para verificar se pode ir para a tela de fim de jogo
                if (controller.endCheckGameLoop() == true) {
                  Navigator.of(button).pushNamed('/PointsView');
                }
              },
            ),
          ),
        ],
      );
    });
  }
}
