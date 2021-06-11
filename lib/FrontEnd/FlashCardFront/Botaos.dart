import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:provider/provider.dart';

import '../../Controller.dart';
import 'FlashCardFront.dart';

class Botaos extends StatelessWidget {
  bool value;
  Botaos({Key? key, required BuildContext context, required this.value})
      : super(key: key);
  bool _myBoolean = false;

  @override
  Widget build(BuildContext screen) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Acertou? "),
              Opacity(
                opacity: opacity,
                child: Checkbox(
                    value: value,
                    activeColor: Color(0xff8FDC97),
                    onChanged: (value) {
                      _myBoolean = value!;
                      print(opacity);
                      Provider.of<Controller>(screen, listen: false)
                          .setAcertou(_myBoolean);
                    }),
              ),
            ]),
        SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: ElevatedButton(
                child: Text("Yes Yes Yes Yes Yes"),
                onPressed: () {},
              ),
            ),
            SizedBox(width: 50),
            Container(
              child: ElevatedButton(
                child: Text("No No No No No No"),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
