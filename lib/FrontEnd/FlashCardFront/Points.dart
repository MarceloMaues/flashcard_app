import 'package:flutter/material.dart';

int points = 5;
int maxPoints = 10;

class Points extends StatelessWidget {
  @override
  Widget build(BuildContext screen) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(87, 196, 229, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(87, 196, 229, 1),
          actions: [],
        ),
        body: Column(
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
                    'Points',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),             
            ]),
        Container(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 150),
            child: Text('Points ${points}/${maxPoints}'),
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
                  Navigator.of(screen).pushNamed('/');
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(143, 220, 151, 1),
                elevation: 20.0,
                textStyle: TextStyle(
                  fontSize: 30,
                ),
              ),
              child: const Text(
                '  Home  ',
              ),
            ),
          ],
        ),
      ],
        ),
    );
  }
}
