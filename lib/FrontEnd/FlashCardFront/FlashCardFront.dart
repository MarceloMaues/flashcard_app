import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        backgroundColor: Color.fromRGBO(87, 196, 229, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(87, 196, 229, 1),
          actions: [
            IconButton(
              icon: const Icon(Icons.edit),
              color: Colors.white,
              onPressed: (){
                //Navigator.push(context, new MaterialPageRoute(
                  //builder: (context) => MyAp()));
              },
            ),
          ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_sharp),
            color: Colors.white,
            onPressed: () => {print("cavalo")},
          ),
        ),
        body: Center(child: FlashcardFront()),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FlashcardFront extends StatelessWidget {
  @override
  Widget build(BuildContext screen) {
    return new Column(
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
                    'sdad',
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
        Container(
          child: Text(
            'Texto aaaaaa',
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
            SizedBox(height: 100),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(143, 220, 151, 1),
                elevation: 20.0,
                textStyle: TextStyle(
                  fontSize: 30,
                ),
              ),
              child: const Text('  Turn  ', ),
            ),
          ],
        ),
      ],
    );
  }
}
