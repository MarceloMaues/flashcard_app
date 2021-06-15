import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:provider/provider.dart';

import '../../Controller.dart';
import 'FlashCardFront.dart';

int counterIsCorrect = 0;

class Botaos extends StatelessWidget {
  bool value;
  Botaos({Key? key, required BuildContext context, required this.value})
      : super(key: key);
  bool _myBoolean = false;

  @override
  Widget build(BuildContext screen) {
    return Container(
      //padding: EdgeInsets.all(50.0),
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xff8FDC97),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    '  Got it?',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                
                Checkbox(
                    value: value,
                    activeColor:  Color.fromRGBO(87, 196, 229, 1),
                    onChanged: (value) {
                      _myBoolean = value!;
                      counterIsCorrect++;
                      print(counterIsCorrect);
                      Provider.of<Controller>(screen, listen: false)
                          .setAcertou(_myBoolean);
                    }),
              ]),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    ));
  }
}
